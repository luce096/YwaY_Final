let key;      //api키 
let key2;      //리밋을 피하기위한 두번째 api키
let key3;   //멀티서치 용도
let key4;
let key5;
let key6;
let puuid;   //사이트 접속 하자마자 처음 뜨는 아이디
const DebugLevel = false;  //디버깅 레벨?

let championData = undefined; //챔피언 데이터
let spellData = undefined;   //스펠 데이터
let perkData = undefined;   //룬 데이터
let detailPerkData = undefined;   //세부룬 데이터
let itemImageData = undefined;   //아이템 이미지 데이터

let championKeyDict = {};   //챔피언 키 딕셔너리
let spellKeyDict = {};     //스펠 키 딕셔너리
let perkKeyDict = {};     //룬 키 딕셔너리
let detailPerkKeyDict = {};   //세부룬 키 딕셔너리
let latestDataDragonVer = "";  //데이터드래곤 버전관리
let maxHistoryItemCall = DebugLevel?3:15;  //맥스 히스토리 카운트
let currentGameTimer = null;   // 게임 시간 타이머
let multisearchnamelist = "";
const MPlist = [];
const msMatchid=[];


$(document).ready(function(){   //도큐먼트 레디
    $.ajax({
        url: "resources/json/credentials.json?version=17",
        type: 'GET',
        dataType: 'json',
        async: false,
        success: function(res){
            console.log("credentials load complete!");
            console.log(res);
			
            key = res.riot_api_key;
            key2 = res.riot_api_key2;
            key3 = res.riot_api_key3;
            key4 = res.riot_api_key4;
            key5 = res.riot_api_key5;
            key6 = res.riot_api_key6;
            puuid = res.my_account_puuid;
        },
        error: function(req, stat, err){
            console.log(err);
        },
   
    });

    let getLatestDataDragonVersionRequest = $.ajax({    //데이터드래곤 최신버전 유지
        url: "https://ddragon.leagueoflegends.com/api/versions.json",
        type: "GET",
        dataType: "json",
        success: function(res){
            latestDataDragonVer = res[0];

            let loadInitialDataRequestCallback = [];
            let getItemJsonRequest = $.ajax({
                url: getLatestDataDragonURL() + "/data/en_US/item.json",    //아이템
                type: "GET",
                dataType: "json",
                success: function(res){
                    itemImageData = res.data;
                }
            });
            let getPerkJsonRequest = $.ajax({
                url: "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/perks.json",   //룬
                type: "GET",
                dataType: "json",
                success: function(res){
                    for(let i=0;i<res.length;i++){
                        let val = res[i];
                        detailPerkKeyDict[val.id] = val;
                    }
                }
            });
            let getRuneJsonRequest = $.ajax({
                url: getLatestDataDragonURL() + "/data/en_US/runesReforged.json",  //룬
                type: "GET",
                dataType: "json",
                success: function(res){
                    for(let i=0;i<res.length;i++){
                        let val = res[i];
                        perkKeyDict[val.id] = val;
                    }
                }
            });
            let getSummonerSpellJsonRequest = $.ajax({
                url:  getLatestDataDragonURL() + "/data/en_US/summoner.json",   //스펠
                type: "GET",
                dataType: "json",
                success: function(res){
                    spellData = res.data;
                    for(let key in spellData){
                        let value = spellData[key];
                        spellKeyDict[value.key] = value.id;
                    }
                }
            });
            let getChampionJsonRequest = $.ajax({
                url: getLatestDataDragonURL() + "/data/ko_KR/champion.json",    //챔피언 데이터
                type: "GET",
                dataType: "json",
                success: function(res){
                    championData = res.data;
                    for(let key in championData){
                        let value = championData[key];
                        championKeyDict[value.key] = value.id;
                    }
                }
            });

            loadInitialDataRequestCallback.push(getItemJsonRequest);      //아이템 요청
            loadInitialDataRequestCallback.push(getPerkJsonRequest);       //룬 요청
            loadInitialDataRequestCallback.push(getRuneJsonRequest);        //룬 요청
            loadInitialDataRequestCallback.push(getSummonerSpellJsonRequest);   //스펠 요청
            loadInitialDataRequestCallback.push(getChampionJsonRequest);     //챔피언 요청
            loadInitialDataRequestCallback.push(getLatestDataDragonVersionRequest);    //데이터 드래곤 버전요청

            //Load
            $.when.apply(null, loadInitialDataRequestCallback).done(function(){   //초기 로드?
                getSummonerInfo("puuid", puuid);
            	
            });
        },
    });

    const searcherInput = $('#search_summoner_input');  //엔터를 누르면 검색됨
    searcherInput.on("keydown", function(e){
        if(e.key == "Enter") {
            getSummonerInfo("name", searcherInput.val());
        }
    });
    //멀티서치용도
    
    const multisearchInp = $('#searchbutton');
    const multicontents = $('#multi-search-input');
    multisearchInp.on("click",function(){
   	let a = multicontents.val().replace(/\n/g,'');
    multisearchnamelist = a.split('님이 방에 참여했습니다.');
   	multisearchnamelist.splice(multisearchnamelist.length-1);
    getmultisearchinfo(multisearchnamelist);
    });


	//최근전적을 띄우기 위한 용도
    let totalItemWrapper = $('#game_history_item_wrapper');
    let innerItem = $('#game_history_item');
    let rolledTab = $('#game_history_item_desc');

    let rolledTabHeight = rolledTab.outerHeight();
    let originalTotalWrapperHeight = totalItemWrapper.height();
    let strechedTotalWrapperHeight = originalTotalWrapperHeight + rolledTabHeight;
    let rolledTopOffset = -rolledTabHeight;
    rolledTab.css("top", (originalTotalWrapperHeight)+"px");
    rolledTab.css("z-index", "9950");

    // 디버깅용 탭 상세 펼치기
     let animationStyle = 'easeOutCirc';
     let animationDelay = 500;

     innerItem.on("click", function(){
         let isFolded = totalItemWrapper.hasClass('folded');
         if(isFolded){
             rolledTab.css("display", "inline-block");
             totalItemWrapper.animate({
                 height: strechedTotalWrapperHeight
             }, animationDelay, animationStyle, function(){
                 totalItemWrapper.removeClass('folded');
                 totalItemWrapper.addClass('unfolded');
             });
         }
         else {
             totalItemWrapper.animate({
                 height: originalTotalWrapperHeight
             }, animationDelay, animationStyle, function(){
                 rolledTab.css("display", "none");
                 totalItemWrapper.removeClass('unfolded');
                 totalItemWrapper.addClass('folded');
             });
         }
     });

    //Content Containers
    const recentGameInfoContent = $('#recent_game_info_container');
    const masteryInfo = $('#mastery_info_container');
    const currentGameInfo = $('#current_game_info_container');
    const mainInfoContainers = $('.main-info-tab');
   

    //Selector Tab
    const recentGameHistoryInfoTab = $('#recent_game_history_info_tab');
    const currentGameInfoTab = $('#current_game_info_tab');
    const masteryInfoTab = $('#mastery_info_tab');
    const InfoTabBundle = $('.info-tab');
   	

    const bodyContent = $('#body_content');

    animationDelay = 500;
    animationStyle = "easeOutQuint";

    const originHeight = 242;

    recentGameHistoryInfoTab.on("click", function(){
        recentGameInfoContent.animate({
            left: 0,
        }, animationDelay, animationStyle);
        masteryInfo.animate({
            left: '100%',
        }, animationDelay, animationStyle);
        currentGameInfo.animate({
            left: '200%',
        }, animationDelay, animationStyle);

        InfoTabBundle.css("background-color", "#444");
        $(this).css("background-color", "#222");
    });
    masteryInfoTab.on("click", function(){
        recentGameInfoContent.animate({
            left: '-100%',
        }, animationDelay, animationStyle);
        masteryInfo.animate({
            left: 0,
        }, animationDelay, animationStyle);
        currentGameInfo.animate({
            left: '100%',
        }, animationDelay, animationStyle);

        InfoTabBundle.css("background-color", "#444");
        $(this).css("background-color", "#222");
    });
    currentGameInfoTab.on("click", function(){
        recentGameInfoContent.animate({
            left: '-200%',
        }, animationDelay, animationStyle);
        masteryInfo.animate({
            left: '-100%',
        }, animationDelay, animationStyle);
        currentGameInfo.animate({
            left: 0,
        }, animationDelay, animationStyle);

        InfoTabBundle.css("background-color", "#444");
        $(this).css("background-color", "#222");
    });
    

    const detailMenuListTabContainer = $('.detail-menu-list-tab');
    const generalMatchInfoTab = $('#general_match_info_tab');
    const dealAmountInfoTab = $('#deal_amount_info_tab');
    const pulledByDealInfo = $('.participant-info .pulled-deal-container');
    const pushedByDealInfo = $('.participant-info .pushed-deal-container');

    dealAmountInfoTab.on("click", function(){
        pulledByDealInfo.animate({
            left: '200px',
        }, animationDelay, animationStyle);
        pushedByDealInfo.animate({
            left: '280px',
        }, animationDelay, animationStyle);
        detailMenuListTabContainer.removeClass("focused");
        detailMenuListTabContainer.addClass("unfocused");
        $(this).removeClass("unfocused");
        $(this).addClass("focused");
    });

    generalMatchInfoTab.on("click", function(){
        pulledByDealInfo.animate({
            left: 0,
        }, animationDelay, animationStyle);
        pushedByDealInfo.animate({
            left: '480px',
        }, animationDelay, animationStyle);
        detailMenuListTabContainer.removeClass("focused");
        detailMenuListTabContainer.addClass("unfocused");
        $(this).removeClass("unfocused");
        $(this).addClass("focused");
    });

    //Point
    currentGameInfoTab.click();
     dealAmountInfoTab.click();
});







function getSummonerInfo(method, data){
    whenFindNewSummoner();
    let AfterURL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/";
    switch(method){
        case "name":
            AfterURL += "by-name/"+data;
            break;
        case "puuid":
            AfterURL += "by-puuid/"+data;
            break;
        default:
            return;
    }

    $.ajax({
        url: AfterURL,
        type: "GET",
        dataType: "json",
        data: {
            "api_key": key,
        },
        success: function(res){
            //Point
            loadSummonerGeneralInfo(res);
            getSummonerLeagueInfoBySummonerID(res.id)
            getSummonerRecentGameHistoryBySummonerAccountID(res);
            getCurrentMatchBySummonerID(res.id);
            getSummonerMasteryInfoBySummonerID(res.id);
        },
        error: function(req, stat, err){
            console.log(err);
            if(err == "Not Found") alert("존재하지 않는 소환사");
            else if(err == "Forbidden") alert("API_KEY 만료됨");
        },
    });
}


//멀티서치 - 소환사 이름을 리스트로 받아서 각각 소환사의 puuid획득
function getmultisearchinfo(multisearchnamelist){
for(let i=0;i<multisearchnamelist.length;i++){
       (function(i){
       let mmname = multisearchnamelist[i];
        $.ajax({
        url:  "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+mmname+"/?",
        type: "GET",
        dataType: "json",
        async:false,
        data: {
            "api_key": key3,
        },
        success: function(res){
        let a = res.puuid;
        MPlist[i] = a;    	  
        },
        error: function(req, stat, err){
            console.log(err);
            console.log("에러");
        },
    });   
 })(i);
} //포문끝
console.log("멀티서치를 위해서 받아온 소환사들의 puuid",MPlist);
getMultisearchmatchid(MPlist); //멀티서치를 위해서 받아온 소환사들의 puuid로 매치 아이디획득하는함수 
 } //함수끝
   
//멀티서치를 위해서 받아온 소환사들의 puuid로 매치 아이디획득하는함수
function getMultisearchmatchid(MPlist){
for(let i=0;i<MPlist.length;i++){
(function(i){
		let v = MPlist[i];
        $.ajax({
        url: "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+v+"/ids",
        type: "GET",
        dataType: "json",
        async:false,
        data: {
            "api_key": key3,
            "start": 0,
            "count": 10,
        },
        success: function(res){   
        msMatchid[i]=res;
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });  //에이작스 끝
	})(i);
} //포문끝
 
 if(msMatchid[0] !=undefined){
 getmultisearchmatches1(msMatchid);   //멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
 }
 if(msMatchid[1] !=undefined){
 getmultisearchmatches2(msMatchid);   //멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
 }
 if(msMatchid[2] !=undefined){
 getmultisearchmatches3(msMatchid);   //멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
 }
 if(msMatchid[3] !=undefined){
 getmultisearchmatches4(msMatchid);   //멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
 }
 if(msMatchid[4] !=undefined){
 getmultisearchmatches5(msMatchid);   //멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
 }
}//함수끝


//멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
let muMatchess = [];
function getmultisearchmatches1(msMatchid){
for(let i=0;i<10;i++){
(function(i){
        $.ajax({
        url: "https://asia.api.riotgames.com/lol/match/v5/matches/"+msMatchid[0][i]+"/?",
        type: "GET",
       
        dataType: "json",
        async:false,
        data: {
            "api_key": key4,
        },
        success: function(res){   
        muMatchess[i]=res;
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });  //에이작스 끝
	})(i);
}//포문끝

 getuserMatch1(multisearchnamelist,muMatchess);
}//함수끝

//멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
let muMatchess2 = [];
function getmultisearchmatches2(msMatchid){
for(let i=0;i<10;i++){
(function(i){
        $.ajax({
        url: "https://asia.api.riotgames.com/lol/match/v5/matches/"+msMatchid[1][i]+"/?",
        type: "GET",
        dataType: "json",
        async:false,
        data: {
            "api_key": key4,
        },
        success: function(res){   
        muMatchess2[i]=res;
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });  //에이작스 끝
	})(i);
}//포문끝

 getuserMatch2(multisearchnamelist,muMatchess2);
}//함수끝


//멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
let muMatchess3 = [];
function getmultisearchmatches3(msMatchid){
for(let i=0;i<10;i++){
(function(i){
        $.ajax({
        url: "https://asia.api.riotgames.com/lol/match/v5/matches/"+msMatchid[2][i]+"/?",
        type: "GET",
       
        dataType: "json",
        async:false,
        data: {
            "api_key": key5,
        },
        success: function(res){   
        muMatchess3[i]=res;
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });  //에이작스 끝
	})(i);
}//포문끝

 getuserMatch3(multisearchnamelist,muMatchess3);
}//함수끝


//멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
let muMatchess4 = [];
function getmultisearchmatches4(msMatchid){
for(let i=0;i<10;i++){
(function(i){
        $.ajax({
        url: "https://asia.api.riotgames.com/lol/match/v5/matches/"+msMatchid[3][i]+"/?",
        type: "GET",
       
        dataType: "json",
        async:false,
        data: {
            "api_key": key5,
        },
        success: function(res){   
        muMatchess4[i]=res;
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });  //에이작스 끝
	})(i);
}//포문끝


 getuserMatch4(multisearchnamelist,muMatchess4);
}//함수끝


//멀티서치 띄우기위해서 받아온 소환사들의 매치 아이디로 매치내용 획득하는 함수
let muMatchess5 = [];
function getmultisearchmatches5(msMatchid){
for(let i=0;i<10;i++){
(function(i){
        $.ajax({
        url: "https://asia.api.riotgames.com/lol/match/v5/matches/"+msMatchid[4][i]+"/?",
        type: "GET",
       
        dataType: "json",
        async:false,
        data: {
            "api_key": key6,
        },
        success: function(res){   
        muMatchess5[i]=res;
        //console.log("멀티서치 띄우기위해서 받아온 소환사들의 매치내용",muMatchess5);
       //getuserMatch(multisearchnamelist,muMatchess5);
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });  //에이작스 끝
	})(i);
}//포문끝

 getuserMatch5(multisearchnamelist,muMatchess5);
}//함수끝



function getSummonerMasteryInfoBySummonerID(id){
    $.ajax({
        url: "https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/"+id,
        type: "GET",
       
        dataType: "json",
        data: {
            "api_key": key,
        },
        success: function(res){
        loadSummonerMasteryList(res);
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });
}

//puuid를 통해서 매치 아이디를 받아옴
let matchId;
function getSummonerRecentGameHistoryBySummonerAccountID(userInfo){
    $.ajax({
        url: "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+userInfo.puuid+"/ids",
        type: "GET",
       
        dataType: "json",
        data: {
            "api_key": key,
            "start": 0,
            "count": 10,
        },
        success: function(res){
            matchId = res;
            loadSummonerMatchHistory(userInfo,matchId);  //매치 아이디를 통해서 매치 내용을 받아오고 내용 로드
        },
        error: function(req, stat, err){
            console.log(err);
        },
    });  //에이작스 끝
}

//내가 검색한 유저의 랭크 티어 정보를 가져옴

function getSummonerLeagueInfoBySummonerID(id){
    $.ajax({
        url: "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+id,
        type: "GET",
        dataType: "json",
        data: {
            "api_key": key,
        },
        success: function(res){
            loadSummonerLeagueInfo(res);
        },
        error: function(req, stat, err){
            console.log(err);
            if(err == "Service Unavailable") alert('현재 API 서버 사용 불가능함');
        },
    });
}

//내가 검색한 유저의 인게임 정보를 가져옴
let searchIn;
function getCurrentMatchBySummonerID(id){
    $.ajax({
        url: "https://kr.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/"+id,
        type: "GET",
        dataType: "json",
        data: {
            "api_key": key,
        },
        success: function(res){
            searchIn = res;
            // 게임 중
            getIngameSummonerId(res);
        },
        error: function(req, stat, err){
                $('#current_game_info_content_wrapper').css("display", "none");
                $('#not_playing_now_container').css("display", "inline-block");
                $('#current_game_info_tab').css("box-shadow", "none");
                console.log("게임 중이 아님"); 
        },
    });
}


//인게임중인 소환사들의 아이디 획득
let ingameList = [];
function getIngameSummonerId(res){ 
 for(let i=0;i<10;i++){
       (function(i){
       $.ajax({
        url: "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+res.participants[i].summonerName+"/?",
        type: "GET",
        dataType: "json",
        async:false,
        data: {
            "api_key": key2,
        },
        success: function(res){
        let q = res.id;
    	ingameList[i] = q;	  
        },
       	 	error: function(req, stat, err){
            console.log(err);
            console.log("에러");
        },
    });   
})(i);
}
getSummonerTier(ingameList);
}

//인게임 소환사들의 받아온 정보로 각각 유저의 티어 획득
let SummonerList = [];
function getSummonerTier(ingameList){
	for(let i=0;i<10;i++){
	       (function(i){
	       $.ajax({
	        url: "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+ingameList[i],
	        type: "GET",
	        dataType: "json",
	        async:false,
	        data: {
	            "api_key": key2,
	        },
	        success: function(res){
	        SummonerList[i] = res;
	        },
	        error: function(req, stat, err){
	            console.log(err);
	        },
	   
	    });
	})(i);
}
 loadCurremtMatchInfo(searchIn,SummonerList);

}



//인게임 정보 표출
function loadCurremtMatchInfo(info,www){
    let queueTypeInfo = getQueueTypeInfo(info.gameQueueConfigId);
    $('#current_game_info_tab').css("box-shadow", "0 0 8px rgb(9, 255, 9)");
    $('#current_game_info_content_wrapper').css("display", "inline-block");
    $('#not_playing_now_container').css("display", "none");
    $('#current_game_info_content_wrapper .current-game-map-type').text(queueTypeInfo.MapLabel);

    const startTime = info.gameStartTime;
    const elapsedTimeText = $('#current_game_elapsed_time');
    currentGameTimer = setInterval(function(){
        let current = new Date().getTime();
        let elapsed = parseInt((current - startTime)/1000);
        let min = parseInt(elapsed/60);
        let sec = elapsed%60;

        let timeText = min + "분 " + sec + "초";

        if(info.gameStartTime == 0) timeText = "오류 발생"
        elapsedTimeText.text(timeText);
    }, 1000);

    const blueTeam = $('.blue-team .team-info-container');
    const redTeam = $('.red-team .team-info-container');

    const originalItems = $('.teammate-info-item');
    originalItems.remove();

    let currentPlayersInfoBundle = info.participants;
    let currentBanInfoBundle = info.bannedChampions;
    let segmentBundle = [];
    for(let i=0;i<currentPlayersInfoBundle.length;i++){
        let currentPlayerInfo = currentPlayersInfoBundle[i];
        let currentBanInfo = currentBanInfoBundle[i];
        let ggg = www[i][0];
        let win_rate = Math.trunc(ggg.wins/(ggg.wins+ggg.losses)*100);
        let type_info = getConvertedLeagueType(ggg.queueType);
        let itemSegment = `
        <div class="teammate-info-item">
            <div class="teammate-info-champion-image" id="current_player_champion_image_${i}"></div>
            <div class="perk-rune-wrapper">
                <div class="spell-perk-container">
                    <div id="current_player_rune_img1_${i}"></div>
                    <div id="current_player_rune_img2_${i}"class="sec-spell-perk-img"></div>
                </div>
                <div class="spell-perk-container perk-container">
                    <div id="current_player_perk_img1_${i}"></div>
                    <div id="current_player_perk_img2_${i}" class="sec-spell-perk-img"></div>
                </div>
            </div>
            <div class="username-wrapper">
                <span class="username">${currentPlayerInfo.summonerName}</span>
            </div>
            <div class="tier_img">
            	<span class="tier_img"><img src="resources/img/LOL_tier/${ggg.tier}.png" width= "39px", height= "39px", display="inline-block"></span>
            </div>
            <div class="current-season-rank-wrapper rank-position">
           	<table>
				<tr>${type_info.type}|</tr>
				<tr>${ggg.tier}|${ggg.rank} </tr>
				<tr>${ggg.wins}|${ggg.losses}| ${win_rate}%</tr>
           	</table>
           	</div>
          	<div class="teammate-info-champion-image" id="current_ban_champion_image_${i}"></div> 
        </div>`;
        segmentBundle.push(itemSegment);
    }
    for(let i=0;i<5;i++){
        blueTeam.append(segmentBundle[i]);
    }
    for(let i=5;i<segmentBundle.length;i++){
        redTeam.append(segmentBundle[i]);
    }

    for(let i=0;i<currentPlayersInfoBundle.length;i++){
        let currentPlayerInfo = currentPlayersInfoBundle[i];
        let currentBanInfo = currentBanInfoBundle[i];
        let currentPlayerChampionImgDiv = $('#current_player_champion_image_'+i);
        let currentPlayerRune1Div = $('#current_player_rune_img1_'+i);
        let currentPlayerRune2Div = $('#current_player_rune_img2_'+i);
        let currentPlayerPerk1Div = $('#current_player_perk_img1_'+i);
        let currentPlayerPerk2Div = $('#current_player_perk_img2_'+i);
		let currentBanChampionImgDiv = $('#current_ban_champion_image_'+i);
		
        let curChampionInfo = getChampionInfoFromKey(currentPlayerInfo.championId);
        let champion_img_url = getLatestDataDragonURL()+"/img/champion/"+curChampionInfo.id+".png";
        let spell1_url_def = getLatestDataDragonURL()+"/img/spell/"+getSpellInfoFromKey(currentPlayerInfo.spell1Id).id+".png";
        let spell2_url_def = getLatestDataDragonURL()+"/img/spell/"+getSpellInfoFromKey(currentPlayerInfo.spell2Id).id+".png";
        
        let perk1_info = getPerkInfoFromKey(currentPlayerInfo.perks.perkStyle);
        let perk2_info = getPerkInfoFromKey(currentPlayerInfo.perks.perkSubStyle);
        let perk1ImageURL = "https://ddragon.leagueoflegends.com/cdn/img/"+perk1_info.icon;
        let perk2ImageURL = "https://ddragon.leagueoflegends.com/cdn/img/"+perk2_info.icon;
		let ban_img_url = "resources/img/Champion_No/"+currentBanInfo.championId+".png";
		
		
        currentPlayerChampionImgDiv.css("background-image", `url(${champion_img_url})`);
        currentPlayerRune1Div.css("background-image", `url(${spell1_url_def})`);
        currentPlayerRune2Div.css("background-image", `url(${spell2_url_def})`);
        currentPlayerPerk1Div.css("background-image", `url(${perk1ImageURL})`);
        currentPlayerPerk2Div.css("background-image", `url(${perk2ImageURL})`);
   		 currentBanChampionImgDiv.css("background-image", `url(${ban_img_url})`);
    }
}
//챔피언 숙련도 정포 표출
function loadSummonerMasteryList(masteryEntries){
    const championMasteryList = $('#champion_mastery_list');
    const championMasteryItems = $('.champion-mastery-item');
    championMasteryItems.remove();

    let masteryTotalScore = 0;
    let masteryLevelStack = [0,0,0,0,0,0,0,0];
    masteryLevelStack.length = 8;

    for(let i=0;i<10;i++){
        let masteryEntry = masteryEntries[i];
        let entryLabel = "normal-mastery";
        let entryIndex = i+1;
        if(i<3) entryLabel = "highest"+entryIndex+"-mastery";
        let championInfo = getChampionInfoFromKey(masteryEntry.championId);
        if(championInfo == undefined) continue;
        let championImgPath = getLatestDataDragonURL()+"/img/champion/"+championInfo.id+".png";
        let masteryAmount = masteryEntry.championPoints;
        let masteryLevel = masteryEntry.championLevel;

        let masterySegment = `
        <div class="champion-mastery-item ${entryLabel}" id="champion_mastery_item_${i}">
            <div class="mastery-champion-img" id="mastery_champion_img_${i}"></div>
            <span class="mastery-champion-name">${championInfo.name}</span>
            <span class="champion-mastery">${numberWithCommas(masteryAmount)} 점</span>
        </div>
        `;

        championMasteryList.append(masterySegment);
        $('#mastery_champion_img_'+i).css("background-image", `url(${championImgPath})`);
        let championMasteryItemView = $('#champion_mastery_item_'+i);
        switch(masteryLevel){
            case 7:
                championMasteryItemView.css("background", "linear-gradient(to right, #009683, #111)");
                break;
            case 6:
                championMasteryItemView.css("background", "linear-gradient(to right, #b800b0, #111)");
                break;
            case 5:
                championMasteryItemView.css("background", "linear-gradient(to right, #c10, #111)");
                break;
            default:
                championMasteryItemView.css("background", "linear-gradient(to right, #6f6f6f, #111)");
                break;
        }
        
        masteryLevelStack[masteryLevel]++;
        masteryTotalScore += masteryAmount;
    }
    for(let i=7;i>=3;i--){
        let masterySegAmountView = $(`#champion_mastery${i}_total_value`);
        masterySegAmountView.text(masteryLevelStack[i]);
    }
    $('#total_mastery').text(numberWithCommas(masteryTotalScore)+" 점");
}
//매치 아이디를 가지고 매치 내용을 받아옴
let match_df = [];
function loadSummonerMatchHistory(userInfo, matchId){
    let matchList = matchId;
    const gameHistoryListContainer = $('#game_history_list_container');
    const gameHistoryItemBundle = $('.game-history-item-wrapper');

    //Point
    gameHistoryItemBundle.remove();

    let aaa = [];
    let nativeHistoryItemBundle = [];
    let loadHistoryItemCallback = [];
    let participantInfoBundle = [];
    nativeHistoryItemBundle.length = matchList.length;
    participantInfoBundle.length = matchList.length;
    
    for(let i=0;i<10;i++){
        let matchItemInfo = matchList[i];
        let request = $.ajax({
            url: "https://asia.api.riotgames.com/lol/match/v5/matches/"+matchItemInfo+"/?",
            type: "GET",
            dataType: "json",
            data: {
                "api_key": key,
            },
            success: function(res){
                match_df[i] = res;
                let userIndex = getUserIndexFromMatchInfo(userInfo, match_df[i].info.participants);
                if(userIndex === -1){
                
                    alert("citical Error!");
                    return;
                }
                const curUserInfo = match_df[i].info.participants[userIndex];
                const gamePlayTime = match_df[i].info;
                let isWin;
                isWin = curUserInfo.win;
                let isWinLabel = isWin?"승리":"패배";
                let isWinType = isWin?"win":"lose";
                let MapType = "";
                let MapLabel = "";
                let curChampionInfo = getChampionInfoFromKey(curUserInfo.championId);
                let KDA = (curUserInfo.kills + curUserInfo.assists)/curUserInfo.deaths;
                let curUserStat = curUserInfo;
                let MCS = (curUserInfo.totalMinionsKilled + curUserInfo.neutralMinionsKilled);
                let TotalCs = (curUserInfo.totalMinionsKilled + curUserInfo.neutralMinionsKilled);
                let GmT =(gamePlayTime.gameDuration/60); //게임시간 구하기
                let GTT = (TotalCs/GmT).toFixed(1); //게임시간 구한걸로 분당 씨에스 구하기

                console.log(gamePlayTime.gameEndTimestamp-gamePlayTime.gameStartTimestamp);
                const PlayTime = (gamePlayTime.gameEndTimestamp-gamePlayTime.gameStartTimestamp);
                let yyy = new Date(PlayTime);
                let ttttt = yyy.getMinutes();  //분으로 변환
                let tttttt = yyy.getSeconds()+1;  //초로 변
                let tlqkf = Math.floor(((PlayTime/1000)*60)%60);//분
                let tltlqkf = Math.floor((PlayTime/1000)%60);//초
                let team1WinInfoLabel = match_df[i].info.teams[0].win === true ? ["win", "승리"] : ["lose", "패배"];
                let team2WinInfoLabel = match_df[i].info.teams[1].win === true ? ["win", "승리"] : ["lose", "패배"];
                console.log("와드박은개수",curUserStat.wardsPlaced);
                console.log("2단계",team1WinInfoLabel);
                console.log("3단계",team2WinInfoLabel);

                let queueTypeInfo = getQueueTypeInfo(match_df[i].info.queueId);
                let lastSecondContainer = queueTypeInfo.MapLabel==="무작위 총력전"?`
                
                <div class="cc-wrapper">
                    <span>Ward</span>
                    <span>11</span>
                </div>
                `:`
                <div class="ward-wrapper">
                    <span>Ward</span>
                    <span class="normal-ward-num">${curUserStat.wardsKilled}</span><span
                    >/</span><span class="pink-ward-num">${curUserStat.wardsPlaced}</span>
                </div>
                `
                let timeGap = new Date() - match_df[i].info.gameCreation;
                let historyHTMLdocSegment = (`
                <div class="game-history-item-wrapper ${queueTypeInfo.MapType} folded" id="game_history_item_wrapper_${i}">
                    <div class="game-history-item ${isWinType}-type" id="game_history_item_${i}">
                        <div class="item-wrapper">
                            <div class="item-detail-1">
                                <span class="map-type">${queueTypeInfo.MapLabel}</span>
                                <span class="win-or-lose">${isWinLabel}</span>
                                <span class="timelapse">${elapsedTimeFormatter(timeGap)}</span>
                                <span class="timelapse">${ttttt}분${tttttt}초</span>
                            </div>
                            <div class="item-detail-2">
                                <div class="champ-wrapper">
                                    <div class="upper-div">
                                        <div class="main-champion-illust-wrapper" id="main_champion_illust_${i}">
                                            <div class="last-champion-level">${curUserStat.champLevel}</div>
                                        </div>
                                    </div>
                                    <div class="spell-wrapper">
                                        <div class="mid-container">
                                            <div class="spell-img" id="spell_img_${i}_1"></div>
                                            <div class="spell-img" id="spell_img_${i}_2"></div>
                                        </div>
                                    </div>
                                    <div class="spell-wrapper">
                                        <div class="mid-container">
                                            <div class="rune-img" id="rune_img_${i}_1"></div>
                                            <div class="rune-img" id="rune_img_${i}_2"></div>
                                        </div>                                
                                    </div>
                                    <div class="champion-name">
                                        <span>${curChampionInfo.name}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item-detail-3">
                                <div class="KDA-wrapper">
                                    <div class="KDA-score" id="KDA_score_${i}">${refineKDA(KDA)}</div>
                                    <div class="KDA">
                                        <span class="kill">${curUserStat.kills}</span>
                                        <span class="slash">/</span>
                                        <span class="death">${curUserStat.deaths}</span>
                                        <span class="slash">/</span>
                                        <span class="assist">${curUserStat.assists}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item-detail-5">
                                <div class="gold-wrapper">
                                    <span>${curUserStat.goldEarned}G</span>
                                </div>
                            ${lastSecondContainer}
                                <div class="cs-wrapper">
                                    <span>CS</span>
                                    <span class="total-cs">${TotalCs}</span><span 
                                    class="average-cs">(${GTT})</span>
                                </div>
                            </div>
                            <div class="item-detail-4">
                            <div class="item-wrapper">
                                <div class="item-item" id="item_item_img_${i}_0"></div>
                                <div class="item-item" id="item_item_img_${i}_1"></div>
                                <div class="item-item" id="item_item_img_${i}_2"></div>
                                <div class="item-item" id="item_item_img_${i}_deco"></div>
                                <div class="item-item" id="item_item_img_${i}_3"></div>
                                <div class="item-item" id="item_item_img_${i}_4"></div>
                                <div class="item-item" id="item_item_img_${i}_5"></div>
                                <!-- <div class="item-item"></div> -->
                            </div>
                        </div>
                        </div>
                    </div>
                    
                   <div class="game-history-item-description-tab" id="game_history_item_desc_${i}">
                        <div class="item-detail-menu-list-tab">
                            <div class="detail-menu-list-tab general-info focused" style="grid-column: 1;" id="general_match_info_tab_${i}">
                                <span>일반 정보</span>
                            </div>
                            <div class="detail-menu-list-tab deal-amount-info unfocused" style="grid-column: 2;" id="deal_amount_info_tab_${i}">
                                <span>딜량 확인</span>
                            </div>
                        </div>
                        <div class="item-detail-desc-content-wrapper">
                            <div class="item-detail-desc-content">
                                <div class="team-desc-label-wrapper ${team1WinInfoLabel[0]}">
                                    <span class="team-desc-win-or-lose">${team1WinInfoLabel[1]}</span>
                                    <span class="team-label">블루 팀</span>
                               </div>
                                <div class="participant-info-container ${team1WinInfoLabel[0]}" id="participant_info_container_1_${i}">
                                </div>
                                <div class="team-desc-label-wrapper ${team2WinInfoLabel[0]}">
                                    <span class="team-desc-win-or-lose">${team2WinInfoLabel[1]}</span>
                                    <span class="team-label">레드 팀</span>
                                </div>
                                <div class="participant-info-container ${team2WinInfoLabel[0]}" id="participant_info_container_2_${i}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                `);

                let team1infoBundle = [];
                let team2infoBundle = [];

                for(let j=0; j<10;j++){
                    let participantTeam = match_df[i].info.participants[j].teamId;
                    let participantIdentity = match_df[i].info.participants[j];
                    let participantStat = match_df[i].info.participants[j];
                    let participantMinion = participantStat.totalMinionsKilled + participantStat.neutralMinionsKilled;
                    let participnatPlayTime = match_df[i].info;
                    let participantTime =(participnatPlayTime.gameDuration/60); //게임시간 구하기
                	let particiMS = (participantMinion/participantTime).toFixed(1); //게임시간 구한걸로 분당 씨에스 구하기
                    
                    let pKDA = (participantStat.kills + participantStat.assists)/participantStat.deaths;
                    let historyItemDescriptionSegment = `
                    <div class="participant-info">
                        <div class="participant-detail-info-1">
                            <div class="participant-champion-img" id="participant_champion_image_${i}_${j}"></div>
                        </div>
                        <div class="participant-detail-info-2">
                            <div class="participant-summoner-spell-wrapper">
                                <div class="participant-spell" id="participant_spell1_${i}_${j}"></div>
                                <div class="participant-spell" id="participant_spell2_${i}_${j}"></div>
                            </div><div class="participant-summoner-perk-wrapper">
                                <div class="participant-perk" id="participant_perk1_${i}_${j}"></div>
                                <div class="participant-perk zoom-out" id="participant_perk2_${i}_${j}"></div>
                            </div>
                        </div>
                        <div class="participant-detail-info-3">
                            <div class="participant-info-wrapper">
                                <span class="participant-username">
                                    <a href="#" onclick="findNewSummoner('${participantIdentity.summonerName}');">${participantIdentity.summonerName}</a>
                                </span>
                                <span class="participant-tier-level" id="participant_tier_level_${i}_${j}">${participantIdentity.teamPosition}</span>
                            </div>
                        </div>
                        <div class="participant-detail-info-4">
                            <div class="participant-kda-wrapper">
                                <span class="participant-kda-score">${refineKDA(pKDA)}</span>
                                <span class="participant-kda">
                                    <span class="kill">${participantStat.kills}</span>
                                    <span class="slash">/</span>
                                    <span class="death">${participantStat.deaths}</span>
                                    <span class="slash">/</span>
                                    <span class="assist">${participantStat.assists}</span>
                                </span>
                            </div>
                        </div>
                        <div class="participant-detail-flexible-box">
                            <div class="participant-detail-info-5 pulled-deal-container">
                                <div class="participant-cs-wrapper">
                                    <span class="participant-gold">${numberWithCommas(participantStat.goldEarned)} G</span>
                                    <span class="participant-cs">CS ${participantMinion}(${particiMS})</span>
                                </div>
                            </div>
                            <div class="participant-detail-info-6 pulled-deal-container">
                                <div class="participant-item-wrapper">
                                    <div class="participant-item" id="participant_item0_${i}_${j}"></div>
                                    <div class="participant-item" id="participant_item1_${i}_${j}"></div>
                                    <div class="participant-item" id="participant_item2_${i}_${j}"></div>
                                    <div class="participant-item" id="participant_item_deco_${i}_${j}"></div>
                                    <div class="participant-item" id="participant_item3_${i}_${j}"></div>
                                    <div class="participant-item" id="participant_item4_${i}_${j}"></div>
                                    <div class="participant-item" id="participant_item5_${i}_${j}"></div>
                                </div>
                            </div>
                            <div class="participant-detail-info-7 pushed-deal-container">
                                <div class="deal-amount-wrapper">
                                    <span class="total-dealt-amount">${participantStat.totalDamageDealtToChampions}</span> (
                                    <span class="physical-dealt-amount">${participantStat.physicalDamageDealtToChampions}</span> /
                                    <span class="magical-dealt-amount">${participantStat.magicDamageDealtToChampions}</span> /
                                    <span class="true-dealt-amount">${participantStat.trueDamageDealtToChampions}</span> )
                                </div>
                                <div class="max-dealt-bar" id="deal_damage_bar_${i}_${j}">
                                    <div class="physical-dealt-bar"></div><!--
                                    --><div class="magical-dealt-bar"></div><!--
                                    --><div class="true-dealt-bar"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    `;  
					
                    if(participantTeam == 100){
                        team1infoBundle.push(historyItemDescriptionSegment);
                    }else{
                        team2infoBundle.push(historyItemDescriptionSegment);
                    }
                }
				
				


                nativeHistoryItemBundle[i] = {
                    segment: historyHTMLdocSegment,
                    curChampInfo: getChampionInfoFromKey(curUserInfo.championId),
                    curUserInfo: curUserInfo,
                    userKDA: KDA,
                    team1infoBundle: team1infoBundle,
                    team2infoBundle: team2infoBundle,
                };

                participantInfoBundle[i] = {
                    participantIdentities: match_df[i].info.participants,
                    participants: match_df[i].info.participants,
                }
            },
            error: function(req, stat, err){
                console.log(err);
                // if(err == "Too Many Requests") alert('요청이 너무 빠릅니다!');
            },
        });
		//})(i);
        loadHistoryItemCallback.push(request);
    }
	
    
    $.when.apply(null, loadHistoryItemCallback).done(function(){
        for(let i=0;i<10;i++){
            nativeInfoSegment = nativeHistoryItemBundle[i];
            participantInfoSegment = participantInfoBundle[i];
            gameHistoryListContainer.append(nativeInfoSegment.segment);
            let curChampionInfo = nativeInfoSegment.curChampInfo;
            let curUserInfo = nativeInfoSegment.curUserInfo;
            let curUserKDA = nativeInfoSegment.userKDA;
            let curTeam1Info = nativeInfoSegment.team1infoBundle;
            let curTeam2Info = nativeInfoSegment.team2infoBundle;
            let participantIdentitiesInfo = participantInfoSegment.participantIdentities;
            let participantsInfo = participantInfoSegment.participants;
            let champion_img_url = getLatestDataDragonURL()+"/img/champion/"+curChampionInfo.id+".png";
            let spell1_url_def = getLatestDataDragonURL()+"/img/spell/"+getSpellInfoFromKey(curUserInfo.summoner1Id).id+".png";
            let spell2_url_def = getLatestDataDragonURL()+"/img/spell/"+getSpellInfoFromKey(curUserInfo.summoner2Id).id+".png";
            let perk1_info = getDetailPerkInfoFromKey(curUserInfo.perks.styles[0].selections[0].perk);
            let perk2_info = getPerkInfoFromKey(curUserInfo.perks.styles[1].style);
            let perk1_url_def = "https://ddragon.leagueoflegends.com/cdn/img/"+getRightPathOfDetailPerkImage(perk1_info.iconPath);

            let perk2_url_def = "https://ddragon.leagueoflegends.com/cdn/img/"+perk2_info.icon;
     
            $('#main_champion_illust_'+i).css("background-image", `url(${champion_img_url})`);
            $('#spell_img_'+i+"_1").css("background-image", `url(${spell1_url_def})`);
            $('#spell_img_'+i+"_2").css("background-image", `url(${spell2_url_def})`);

            const rune1 = $('#rune_img_'+i+"_1");
            const rune2 = $('#rune_img_'+i+"_2");
            rune1.css("background-image", `url(${perk1_url_def})`);
            rune1.css("background-size", "100%");
            rune2.css("background-image", `url(${perk2_url_def})`);
            rune2.css("background-size", "80%");
            $('.rune-img').css("background-color", "#111");
            
            $('#KDA_score_'+i).css("background-color", getColorFromKDA(curUserKDA));


            let itemList = [];
            for(let j=0; j<=5; j++) {
                let itemItem = curUserInfo['item'+j];
                let itemInfo = itemImageData[itemItem];
                if(itemItem != 0)
                    itemList.push(itemInfo);
            }
            let sorted = sortItemListWithPrice(itemList);
            for(let j=0; j<sorted.length; j++) {
                let itemImageName = sorted[j].image.full;
                let itemURL = getLatestDataDragonURL()+"/img/item/"+itemImageName;
                $('#item_item_img_'+i+'_'+j).css("background-image", `url(${itemURL})`);
            }

            //장신구는 따로 설정
            let decoItemCode =curUserInfo['item6'];
            if(decoItemCode != 0){
                let decoItemURL = getLatestDataDragonURL()+"/img/item/"+itemImageData[decoItemCode].image.full;
                $('#item_item_img_'+i+'_deco').css("background-image", `url(${decoItemURL})`);
            }

            const team1Container = $('#participant_info_container_1_'+i);
            const team2Container = $('#participant_info_container_2_'+i);

            for(let j=0;j<curTeam1Info.length;j++){
                team1Container.append(curTeam1Info[j]);
            }
            for(let j=0;j<curTeam2Info.length;j++){
                team2Container.append(curTeam2Info[j]);
            }

            //팀 유저 정보
            let maxDealtFromTeam = -1;
            for(let j=0;j<participantsInfo.length;j++){
                let totalDealt = participantsInfo[j].totalDamageDealtToChampions;
                if(totalDealt > maxDealtFromTeam) maxDealtFromTeam = totalDealt;
            }

            if(maxDealtFromTeam === -1){
                maxDealtFromTeam = 200000;
            }

            for(let j=0;j<participantsInfo.length;j++){
                let participantChampionImageView = $('#participant_champion_image_'+i+"_"+j);
                let participantSpell1ImageView = $('#participant_spell1_'+i+"_"+j);
                let participantSpell2ImageView = $('#participant_spell2_'+i+"_"+j);
                let participantPerk1ImageView = $('#participant_perk1_'+i+"_"+j);
                let participantPerk2ImageView = $('#participant_perk2_'+i+"_"+j);
                let participantTierView = $('#participant_tier_level_'+i+"_"+j);

                let participantInfo = participantsInfo[j];
                let participantIdentityInfo = participantIdentitiesInfo[j];
                let participantStat = match_df[i].info.participants[i];
                let participantChampInfo = getChampionInfoFromKey(participantInfo.championId);
                let perk1Info = getDetailPerkInfoFromKey(participantInfo.perks.styles[0].selections[0].perk);
                let perk2Info = getPerkInfoFromKey(participantInfo.perks.styles[1].style);

                let participantChampionImgURL = participantChampInfo == undefined?"unknown":getLatestDataDragonURL()+"/img/champion/"+participantChampInfo.id+".png";
                let spell1ImageURL = getLatestDataDragonURL()+"/img/spell/"+getSpellInfoFromKey(participantInfo.summoner1Id).id+".png";
                let spell2ImageURL = getLatestDataDragonURL()+"/img/spell/"+getSpellInfoFromKey(participantInfo.summoner2Id).id+".png";
                let perk1ImageURL = "https://ddragon.leagueoflegends.com/cdn/img/"+getRightPathOfDetailPerkImage(perk1Info.iconPath);
                let perk2ImageURL = "https://ddragon.leagueoflegends.com/cdn/img/"+perk2Info.icon;

                participantChampionImageView.css("background-image", `url(${participantChampionImgURL})`);
                participantSpell1ImageView.css("background-image", `url(${spell1ImageURL})`);
                participantSpell2ImageView.css("background-image", `url(${spell2ImageURL})`);
                participantPerk1ImageView.css("background-image", `url(${perk1ImageURL})`);
                participantPerk2ImageView.css("background-image", `url(${perk2ImageURL})`);
                participantPerk2ImageView.css("background-size", "80%");

                //전적 아이템마다 같이한 사람들 정보 로드 - request가 많으므로 Product 검사 끝나면 주석 처리 뺄 것
                //getAndLoadParticipantsLeagueInfoBySummonerID(participantTierView, participantIdentityInfo.player.summonerId);
            
                let participantItemList = [];
                for(let k=0; k<=5; k++) {
                    let pitemCode = participantInfo['item'+k];
                    let pitemInfo = itemImageData[pitemCode];
                    if(pitemCode != 0)
                        participantItemList.push(pitemInfo);
                }
                let sorted = sortItemListWithPrice(participantItemList);
                for(let k=0; k<sorted.length; k++) {
                    let itemImageName = sorted[k].image.full;
                    let itemURL = getLatestDataDragonURL()+"/img/item/"+itemImageName;
                    $('#participant_item'+k+"_"+i+'_'+j).css("background-image", `url(${itemURL})`);
                }

                let pdecoItemCode =participantInfo['item6'];
                if(pdecoItemCode != 0){
                    let pdecoItemURL = getLatestDataDragonURL()+"/img/item/"+itemImageData[pdecoItemCode].image.full;
                    $('#participant_item_deco'+"_"+i+'_'+j).css("background-image", `url(${pdecoItemURL})`);
                }

                let participantPhysicalDealtView = $(`#deal_damage_bar_${i}_${j} .physical-dealt-bar`);
                let participantMagicalDealtView = $(`#deal_damage_bar_${i}_${j} .magical-dealt-bar`);
                let participantTrueDealtView = $(`#deal_damage_bar_${i}_${j} .true-dealt-bar`);
                let maxDealtView = $(`#deal_damage_bar_${i}_${j}`);
                let maxDealtViewWidth = maxDealtView.width();

                let physicalDealt = match_df[i].info.participants[i].physicalDamageDealtToChampions;
                let magicalDealt = match_df[i].info.participants[i].magicDamageDealtToChampions;
                let trueDealt = match_df[i].info.participants[i].trueDamageDealtToChampions;
                let totalDealt = match_df[i].info.participants[i].totalDamageDealtToChampions;

                let physicalDealtRate = physicalDealt/maxDealtFromTeam;
                let magicalDealtRate = magicalDealt/maxDealtFromTeam;
                let trueDealtRate = trueDealt/maxDealtFromTeam;

                let physicalDealtWidth = physicalDealtRate * maxDealtViewWidth;
                let magicalDealtWidth = magicalDealtRate * maxDealtViewWidth;
                let trueDealtWidth = trueDealtRate * maxDealtViewWidth;
                
                let maxTrueDealtWidth = maxDealtViewWidth - physicalDealtWidth - magicalDealtWidth;
                
                participantPhysicalDealtView.css("width", physicalDealtWidth+"px");
                participantMagicalDealtView.css("width", magicalDealtWidth+"px");
                participantTrueDealtView.css("width", trueDealtWidth+"px");
            }

            //상세 설명 탭 확장 애니메이션
            let totalItemWrapper = $('#game_history_item_wrapper_'+i);
            let innerItem = $('#game_history_item_'+i);
            let rolledTab = $('#game_history_item_desc_'+i);
        
            let rolledTabHeight = rolledTab.outerHeight();
            let originalTotalWrapperHeight = totalItemWrapper.height();
            let strechedTotalWrapperHeight = originalTotalWrapperHeight + rolledTabHeight;
            let rolledTopOffset = -rolledTabHeight;
            rolledTab.css("top", (originalTotalWrapperHeight)+"px");
            rolledTab.css("z-index", (9900-i)+"");
        
            const animationStyle = 'easeOutQuint';
            const animationDelay = 300;
        
            innerItem.on("click", function(){
                let isFolded = totalItemWrapper.hasClass('folded');
                if(isFolded){
                    rolledTab.css("display", "inline-block");
                    totalItemWrapper.animate({
                        height: strechedTotalWrapperHeight
                    }, animationDelay, animationStyle, function(){
                        totalItemWrapper.removeClass('folded');
                        totalItemWrapper.addClass('unfolded');
                    });
                }
                else {
                    totalItemWrapper.animate({
                        height: originalTotalWrapperHeight
                    }, animationDelay, animationStyle, function(){
                        rolledTab.css("display", "none");
                        totalItemWrapper.removeClass('unfolded');
                        totalItemWrapper.addClass('folded');
                    });
                }
            });

            const detailMenuListTabContainer = $('#game_history_item_desc_'+i+' '+'.detail-menu-list-tab');
            const generalMatchInfoTab = $('#general_match_info_tab_'+i);
            const dealAmountInfoTab = $('#deal_amount_info_tab_'+i);
            const pulledByDealInfo = $('#game_history_item_desc_'+i+' '+'.participant-info .pulled-deal-container');
            const pushedByDealInfo = $('#game_history_item_desc_'+i+' '+'.participant-info .pushed-deal-container');
            const originalPulledTabLeft = $('.participant-detail-info-5').first();
        
            dealAmountInfoTab.on("click", function(){
                pulledByDealInfo.fadeOut(animationDelay);
                pushedByDealInfo.fadeIn(animationDelay);
                detailMenuListTabContainer.removeClass("focused");
                detailMenuListTabContainer.addClass("unfocused");
                $(this).removeClass("unfocused");
                $(this).addClass("focused");
            });
        
            generalMatchInfoTab.on("click", function(){
                pulledByDealInfo.fadeIn(animationDelay);
                pushedByDealInfo.fadeOut(animationDelay);
                detailMenuListTabContainer.removeClass("focused");
                detailMenuListTabContainer.addClass("unfocused");
                $(this).removeClass("unfocused");
                $(this).addClass("focused");
            });
        }

        const winRateInfo = getWinRateInfo(matchList, userInfo , participantInfoBundle);
        let winRate = winRateInfo.winRate;
        let winNum = winRateInfo.winNum;
        let loseNum = winRateInfo.loseNum;

        const winRatePieChartElem = $('#win_rate_pie_chart');
        const winRatePercentageText = $('#win_rate_chart_percentage');
        const winNumText = $('#user_win_num');
        const loseNumText = $('#user_lose_num');
        let winRatePieChart = new Chart(winRatePieChartElem, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [winRate, 100-winRate],
                    backgroundColor: [
                        'rgb(0, 214, 230)',
                        'rgb(250, 40, 40)',
                    ],
                    borderWidth: 0,
                }],
            },
            options: {
                maintainAspectRatio: false,
                cutoutPercentage: 75,
                animation: {
                    easing: 'easeInOutCirc',
                }
            }
        });

        $({
            curPercentValue: 0,
            winNumValue: 0,
            loseNumValue: 0,
        }).animate({
            curPercentValue: parseInt(winRate),
            winNumValue: winNum,
            loseNumValue: loseNum,
        }, {
            duration: 800,
            easing: 'swing',
            step: function(){
                winRatePercentageText.text(Math.ceil(this.curPercentValue)+"%");
                winNumText.text(Math.ceil(this.winNumValue)+"W");
                loseNumText.text(Math.ceil(this.loseNumValue)+"L");
            },
        });
    });
}

function getAndLoadParticipantsLeagueInfoBySummonerID(span, id){
    $.ajax({
        url: "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+id,
        type: "GET",
        dataType: "json",
        data: {
            "api_key": key,
        },
        success: function(res){
            let candidates = [];
            for(let i=0;i<res.length;i++){
                let tier_info = getConvertedLeagueTier(res[i].tier);
                let type_info = getConvertedLeagueType(res[i].queueType);
                let label_info = tier_info.name + " " + res[i].rank;
                candidates.push({
                    tierInfo: tier_info,
                    typeInfo: type_info,
                    labelInfo: label_info,
                });
            }

           for(let i=0;i<candidates.length;i++){
                candidate = candidates[i];
                if(candidate.typeInfo.level === 4){
                    let tierInfo = candidate.tierInfo;
                    span.text(candidate.labelInfo);
                    if(tierInfo.level > 5)
                        span.css("background-image", `linear-gradient( 150deg, ${tierInfo.color}, ${tierInfo.color2})`);
                    else
                        span.css("background-color", `${tierInfo.color})`);
                    return;
                }
            }
            for(let i=0;i<candidates.length;i++){
                candidate = candidates[i];
                if(candidate.typeInfo.level === 3){
                    let tierInfo = candidate.tierInfo;
                    span.text(candidate.labelInfo);
                    if(tierInfo.level > 5)
                        span.css("background-image", `linear-gradient( 150deg, ${tierInfo.color}, ${tierInfo.color2})`);
                    else
                        span.css("background-color", `${tierInfo.color})`);
                    return;
                }
            }
            for(let i=0;i<candidates.length;i++){
                candidate = candidates[i];
                if(candidate.typeInfo.level === 2){
                    let tierInfo = candidate.tierInfo;
                    span.text(candidate.labelInfo);
                    if(tierInfo.level > 5)
                        span.css("background-image", `linear-gradient( 150deg, ${tierInfo.color}, ${tierInfo.color2})`);
                    else
                        span.css("background-color", `${tierInfo.color})`);
                    return;
                }
            }
            for(let i=0;i<candidates.length;i++){
                candidate = candidates[i];
                if(candidate.typeInfo.level === 1){
                    span.text(candidate.labelInfo);
                    span.css("background", "green");
                    return;
                }
            }
            $.ajax({
                url: "https://kr.api.riotgames.com/lol/summoner/v4/summoners/"+id,
                type: "GET",
                aync: false,
                dataType: "json",
                data: {
                    "api_key": key,
                },
                success: function(res){
                    span.text(res.summonerLevel+" 레벨");
                },
                error: function(req, stat, err){
                    if(err == "Not Found") console.log("존재하지 않는 소환사_id: "+id);
                    else if(err == "Forbidden") console.log("API_KEY 만료됨");
                    else{
                        console.log(err);
                        if(err == "Too Many Requests") span.text('Error-1');
                        else span.text('Error-2');
                    }
                },
            });
        },
        error: function(req, stat, err){
            
            if(err == "Service Unavailable") console.log('현재 API 서버 사용 불가능');
            else if(err == "Too Many Requests") console.log('요청이 너무 빠름');
            else console.log(err);
        },
    });
}

function loadSummonerGeneralInfo(info){
    $('#current_summoner_profile_icon_img').attr("src", getLatestDataDragonURL()+"/img/profileicon/"+info.profileIconId+".png");
    $('#current_summoner_name').text(info.name);
    $('#current_summoner_level').text(info.summonerLevel);
}

function loadSummonerLeagueInfo(info){
    const tierInfoWrapper = $('#tier_info_detail_wrapper');
    $('#tier_info_detail_wrapper .small-info-box').remove();

    for(let i=0;i<info.length;i++){
        let tier_info = getConvertedLeagueTier(info[i].tier);
        let tier_rank = tier_info.name+" "+info[i].rank;
        let tier_win_rate = Math.trunc(info[i].wins/(info[i].wins + info[i].losses)*100);
        let converted_type = getConvertedLeagueType(info[i].queueType).type;
        let new_rank_label = converted_type+" | "+tier_rank+ " | "+tier_win_rate+"%" ;
        if(converted_type == "TFT"){
	        	converted_type.pop();
	        }
        tierInfoWrapper.append(`<div class="small-info-box" id="info_box_${converted_type}">${new_rank_label}</div>`);
        let box = $('#info_box_'+converted_type);
        if(tier_info.level > 5 ){
            box.css("border", "2px");
            box.css("border-style", "solid");
            box.css("border-image", `linear-gradient( 150deg, ${tier_info.color}, ${tier_info.color2})`);
            box.css("border-image-slice", "1");
        }
        else{
            box.css("border", `2px solid ${tier_info.color}`);
        }
    }
}

//user func

function whenFindNewSummoner(){
    //새로운 소환사 검색 시 호출
    if(currentGameTimer != null){
        clearInterval(currentGameTimer);
    }
}

function getQueueTypeInfo(type){
    switch(type){
        case 450:
            MapType = "howling-abyss";
            MapLabel = "무작위 총력전";
            MapName = "일반(칼바람 나락)";
            break;
        case 420:
            MapLabel = "솔로 랭크";
            MapType = "summoners-rift";
            MapName = "솔로 랭크";
            break;
        case 430:
            MapLabel = "일반";
            MapType = "summoners-rift";
            MapName = "일반(소환사의 협곡)";
            break;
        case 440:
            MapLabel = "자유 랭크";
            MapType = "summoners-rift";
            MapName = "자유 랭크";
            break;
        case 830:
            MapLabel = "입문 봇전";
            MapType = "summoners-rift";
            MapName = "입문 봇전(소환사의 협곡)";
            break;
        case 840:
            MapLabel = "초보 봇전";
            MapType = "summoners-rift";
            MapName = "초보 봇전(소환사의 협곡)";
            break;
        case 850:
            MapLabel = "중급 봇전";
            MapType = "summoners-rift";
            MapName = "중급 봇전(소환사의 협곡)";
            break;
        case 900:
            MapLabel = "U.R.F";
            MapType = "summoners-rift";
            MapName = "우르프";
            break;
        case 920:
            MapLabel = "포로왕";
            MapType = "howling-abyss";
            MapName = "포로왕(칼바람 나락)";
            break;
        default:
            MapLabel = "qType "+type;
            MapName = "QueueType "+type;
            break;
    }
    return {MapType: MapType, MapLabel: MapLabel};
}

function findNewSummoner(username){
    console.log(username);
    getSummonerInfo("name", username);
}

function getWinRateInfo(matchList, userInfo, partyInfoBundle){
    let winSum = 0;
    for(let i=0;i<matchList.length;i++){
        let partyInfo = partyInfoBundle[i];
        let userIndex = getUserIndexFromMatchInfo(userInfo, partyInfo.participantIdentities);
        const curUserInfo = partyInfo.participants[userIndex];
        let isWin = curUserInfo.win;
        if(isWin) winSum+=1;
    }
    let winRate = winSum*100/matchList.length;
    return {
        winRate: winRate,
        winNum: winSum,
        loseNum: matchList.length - winSum,
    };
}

function getColorFromKDA(kda){
    if(kda<1.5) return "rgba(161, 0, 0, 0.941)";
    if(kda<3) return "rgba(115, 140, 0, 0.941)";
    if(kda<4.5) return "rgba(0, 138, 120, 0.941)";
    if(kda<10) return "rgba(9, 124, 255, 0.941)";
    return "rgba(145, 86, 255, 0.941)";
}

function refineCS(cs){
    return cs.toFixed(3);
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function elapsedTimeFormatter(ctime){
    let stime = parseInt(ctime/1000);
    const year = parseInt(86400*(365.25));
    const month = parseInt(86400*30.4375);
    const day = 86400;
    const hour = 3600;
    const min = 60;

    if(stime >= year) return parseInt(stime/year) + "년 전";
    if(stime >= month) return parseInt(stime/month) + "달 전";
    if(stime >= day) return parseInt(stime/day) + "일 전";
    if(stime >= hour) return parseInt(stime/hour) + "시간 전";
    return parseInt(stime/min) + "분 전";
}

function ccTimeFormatter(cc){
    let mt = parseInt(cc / 60);
    let st = parseInt(cc % 60);
    return String(mt) + ":"+String(st);
}

function itemPriceComparator(a, b){
    let ag = a.gold.total;
    let bg = b.gold.total;
    return bg - ag;
}

function sortItemListWithPrice(list){
    list.sort(itemPriceComparator);
    return list;
}

function getRightPathOfDetailPerkImage(original){
    let slash_index = getPosition(original, "/", 4);
    let remain = original.substring(slash_index+1);
    return remain;
}

function getPosition(string, subString, index) {
    return string.split(subString, index).join(subString).length;
 }

function refineKDA(kda){
    switch(kda){
        case Infinity: return "∞";
    }
    if(isNaN(kda)) return "-";
    
    return kda.toFixed(2);
}

function getDetailPerkInfoFromKey(keyIn){
    return detailPerkKeyDict[keyIn];
}

function getPerkInfoFromKey(keyIn){
    return perkKeyDict[keyIn];
}

function getSpellInfoFromKey(keyIn){
    let keyword = spellKeyDict[keyIn];
    return spellData[keyword];
}

function getChampionInfoFromKey(keyIn){
    let keyword = championKeyDict[keyIn];
    if(keyword == undefined) keyword = "Unknown";
    let refined = keyword.replace(" ","");
    return championData[refined];
}

function getUserIndexFromMatchInfo(userInfo, participants){
    for(let i=0;i<participants.length;i++){
        if(participants[i].summonerName == userInfo.name){
            return i;
        }
    }
    return -1;
}

//멀티서치에 내가 검색한 유저의 10경기에서 내가 검색한 유저가 해당되어 있는내용만 뽑아옴
let mtsl = [];
function getuserMatch1(multisearchnamelist,muMatchess){
	for (let i=0;i<10;i++){
		for (let j=0;j<10;j++){
			if(muMatchess[i].info.participants[j].summonerName == multisearchnamelist[0]){
			mtsl[i] = muMatchess[i].info.participants[j];
			}
		}
	}

//최근 10경기의 kda를 뽑아오는 함수
let jun = getMultiWinRate1(mtsl);//최근 10경기의 승률을 구하는 함수
let js = jun.winRate;
let jw = jun.winNum;
let jl = jun.loseNum;

//멀티서치 결과를 보여줌
getmultisearchresult1(mtsl,jun);

}

//멀티서치에 내가 검색한 유저의 10경기에서 내가 검색한 유저가 해당되어 있는내용만 뽑아옴2
let mtsl2 = [];
function getuserMatch2(multisearchnamelist,muMatchess2){
	for (let i=0;i<10;i++){
		for (let j=0;j<10;j++){
		if(muMatchess2[i].info.participants[j].summonerName == multisearchnamelist[1]){
		mtsl2[i] = muMatchess2[i].info.participants[j];
		}
	}
}

//최근 10경기의 kda를 뽑아오는 함수
let jun = getMultiWinRate2(mtsl2);//최근 10경기의 승률을 구하는 함수
let js = jun.winRate;
let jw = jun.winNum;
let jl = jun.loseNum;

//멀티서치 결과를 보여줌
getmultisearchresult2(mtsl2,jun);

}

//멀티서치에 내가 검색한 유저의 10경기에서 내가 검색한 유저가 해당되어 있는내용만 뽑아옴3
let mtsl3 = [];
function getuserMatch3(multisearchnamelist,muMatchess3){
	for (let i=0;i<10;i++){
		for (let j=0;j<10;j++){
		if(muMatchess3[i].info.participants[j].summonerName == multisearchnamelist[2]){
		mtsl3[i] = muMatchess3[i].info.participants[j];
		}
	}
}
console.log("3번검색자의 경기 데이터만 출력",mtsl3);
//최근 10경기의 kda를 뽑아오는 함수
let jun = getMultiWinRate3(mtsl3);//최근 10경기의 승률을 구하는 함수
let js = jun.winRate;
let jw = jun.winNum;
let jl = jun.loseNum;

//멀티서치 결과를 보여줌
getmultisearchresult3(mtsl3,jun);

}

//멀티서치에 내가 검색한 유저의 10경기에서 내가 검색한 유저가 해당되어 있는내용만 뽑아옴4
let mtsl4 = [];
function getuserMatch4(multisearchnamelist,muMatchess4){
	for (let i=0;i<10;i++){
		for (let j=0;j<10;j++){
		if(muMatchess4[i].info.participants[j].summonerName == multisearchnamelist[3]){
		mtsl4[i] = muMatchess4[i].info.participants[j];
		}
	}
}
console.log("4번검색자의 경기 데이터만 출력",mtsl4);
//최근 10경기의 kda를 뽑아오는 함수
let jun = getMultiWinRate4(mtsl4);//최근 10경기의 승률을 구하는 함수
let js = jun.winRate;
let jw = jun.winNum;
let jl = jun.loseNum;
//멀티서치 결과를 보여줌
getmultisearchresult4(mtsl4,jun);

}


//멀티서치에 내가 검색한 유저의 10경기에서 내가 검색한 유저가 해당되어 있는내용만 뽑아옴5
let mtsl5 = [];
function getuserMatch5(multisearchnamelist,muMatchess5){
	for (let i=0;i<10;i++){
		for (let j=0;j<10;j++){
			if(muMatchess5[i].info.participants[j].summonerName == multisearchnamelist[4]){
			mtsl5[i] = muMatchess5[i].info.participants[j];
			}
		}
}

//최근 10경기의 kda를 뽑아오는 함수
let jun = getMultiWinRate4(mtsl5);//최근 10경기의 승률을 구하는 함수
let js = jun.winRate;
let jw = jun.winNum;
let jl = jun.loseNum;

//멀티서치 결과를 보여줌
getmultisearchresult5(mtsl5,jun);

}




//멀티서치 정보를 출력해줌
function getmultisearchresult2(mtsl2,jun){
 let isWinLabel = [];
 let gamewin = [];
  let isWinType = [];
 let curChampionInfo = [];
 let champion_img_url = [];
for(let i=0;i<mtsl2.length;i++){
		let gamewin = [];
        gamewin[i] = mtsl2[i].win;
        console.log("1단계",gamewin);
        isWinLabel[i] = gamewin[i]?"success":"danger";
        console.log("isWinLabel",isWinLabel);
        isWinType[i] = gamewin[i]?"Win":"Lose";
        console.log("isWinType",isWinType);
		curChampionInfo[i] = getChampionInfoFromKey(mtsl2[i].championId);
        champion_img_url[i] = getLatestDataDragonURL()+"/img/champion/"+curChampionInfo[i].id+".png";
}
const multisearchresult = $('#multi-detail-info-data');
const multise2 = $('#multi_detail_item2');
$('#multi_detail_item2').remove();

	multisearchj2 = `
   <div class="col-xl-6 col-lg-12" style="max-width:13rem;" id="multi_detail_item2">  <!-- 멀티서치 예시 -->
        <div class="card" style="zoom: 1;">
            <div class="card-header no-border">
                <h4 class="card-title">${mtsl2[0].summonerName}<span class="text-muted text-bold-400"></span></h4>
                <a class="heading-elements-toggle"><i class="ft-more-horizontal font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content">
                <div id="deals-list-scroll" class="card-body height-350 position-relative ps-container ps-theme-default" data-ps-id="8d524df2-9cdf-a019-dec2-714633daa2ca">
                    <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[0]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[0].kills}/${mtsl2[0].deaths}/${mtsl2[0].assists}<span class="float-right badge badge-${isWinLabel[0]}">${isWinType[0]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[1]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[1].kills}/${mtsl2[1].deaths}/${mtsl2[1].assists}<span class="float-right badge badge-${isWinLabel[1]}">${isWinType[1]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[2]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[2].kills}/${mtsl2[2].deaths}/${mtsl2[2].assists}<span class="float-right badge badge-${isWinLabel[2]}">${isWinType[2]}</span></p>
                           
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[3]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[3].kills}/${mtsl2[3].deaths}/${mtsl2[3].assists}<span class="float-right badge badge-${isWinLabel[3]}">${isWinType[3]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[4]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[4].kills}/${mtsl2[4].deaths}/${mtsl2[4].assists}<span class="float-right badge badge-${isWinLabel[4]}">${isWinType[4]}</span></p>
                         
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[5]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[5].kills}/${mtsl2[5].deaths}/${mtsl2[5].assists}<span class="float-right badge badge-${isWinLabel[5]}">${isWinType[5]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[6]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[6].kills}/${mtsl2[6].deaths}/${mtsl2[6].assists}<span class="float-right badge badge-${isWinLabel[6]}">${isWinType[6]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[7]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[7].kills}/${mtsl2[7].deaths}/${mtsl2[7].assists}<span class="float-right badge badge-${isWinLabel[7]}">${isWinType[7]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[8]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[8].kills}/${mtsl2[8].deaths}/${mtsl2[8].assists}<span class="float-right badge badge-${isWinLabel[8]}">${isWinType[8]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[9]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl2[9].kills}/${mtsl2[9].deaths}/${mtsl2[9].assists}<span class="float-right badge badge-${isWinLabel[9]}">${isWinType[9]}</span></p>
                          
                        </div>
                    </div>
                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
            </div>
        </div>
    </div>
        `;
        multisearchresult.append(multisearchj2);    
}


//멀티서치 정보를 출력해줌5
function getmultisearchresult5(mtsl5,jun){
 let isWinLabel = [];
 let gamewin = [];
  let isWinType = [];
 let curChampionInfo = [];
 let champion_img_url = [];
for(let i=0;i<mtsl.length;i++){
		let gamewin = [];
        gamewin[i] = mtsl5[i].win;
        isWinLabel[i] = gamewin[i]?"success":"danger";
        isWinType[i] = gamewin[i]?"Win":"Lose";
		curChampionInfo[i] = getChampionInfoFromKey(mtsl5[i].championId);
        champion_img_url[i] = getLatestDataDragonURL()+"/img/champion/"+curChampionInfo[i].id+".png";
}
const multisearchresult = $('#multi-detail-info-data');
const multise5 = $('#multi_detail_item5');
$('#multi_detail_item5').remove();

	multisearchj5 = `
   <div class="col-xl-6 col-lg-12" style="max-width:13rem;" id="multi_detail_item5">  <!-- 멀티서치 예시 -->
        <div class="card" style="zoom: 1;">
            <div class="card-header no-border">
                <h4 class="card-title">${mtsl5[0].summonerName}<span class="text-muted text-bold-400"></span></h4>
                <a class="heading-elements-toggle"><i class="ft-more-horizontal font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content">
                <div id="deals-list-scroll" class="card-body height-350 position-relative ps-container ps-theme-default" data-ps-id="8d524df2-9cdf-a019-dec2-714633daa2ca">
                    <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[0]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[0].kills}/${mtsl5[0].deaths}/${mtsl5[0].assists}<span class="float-right badge badge-${isWinLabel[0]}">${isWinType[0]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[1]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[1].kills}/${mtsl5[1].deaths}/${mtsl5[1].assists}<span class="float-right badge badge-${isWinLabel[1]}">${isWinType[1]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[2]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[2].kills}/${mtsl5[2].deaths}/${mtsl5[2].assists}<span class="float-right badge badge-${isWinLabel[2]}">${isWinType[2]}</span></p>
                           
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[3]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[3].kills}/${mtsl5[3].deaths}/${mtsl5[3].assists}<span class="float-right badge badge-${isWinLabel[3]}">${isWinType[3]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[4]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[4].kills}/${mtsl5[4].deaths}/${mtsl5[4].assists}<span class="float-right badge badge-${isWinLabel[4]}">${isWinType[4]}</span></p>
                         
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[5]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[5].kills}/${mtsl5[5].deaths}/${mtsl5[5].assists}<span class="float-right badge badge-${isWinLabel[5]}">${isWinType[5]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[6]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[6].kills}/${mtsl5[6].deaths}/${mtsl5[6].assists}<span class="float-right badge badge-${isWinLabel[6]}">${isWinType[6]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[7]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[7].kills}/${mtsl5[7].deaths}/${mtsl5[7].assists}<span class="float-right badge badge-${isWinLabel[7]}">${isWinType[7]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[8]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[8].kills}/${mtsl5[8].deaths}/${mtsl5[8].assists}<span class="float-right badge badge-${isWinLabel[8]}">${isWinType[8]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[9]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl5[9].kills}/${mtsl5[9].deaths}/${mtsl5[9].assists}<span class="float-right badge badge-${isWinLabel[9]}">${isWinType[9]}</span></p>
                          
                        </div>
                    </div>
                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
            </div>
        </div>
    </div>
        `;
        multisearchresult.append(multisearchj5);  
}

//멀티서치 정보를 출력해줌3
function getmultisearchresult3(mtsl3,jun){
 let isWinLabel = [];
 let gamewin = [];
  let isWinType = [];
 let curChampionInfo = [];
 let champion_img_url = [];
for(let i=0;i<mtsl3.length;i++){
		let gamewin = [];
        gamewin[i] = mtsl3[i].win;
        console.log("1단계",gamewin);
        isWinLabel[i] = gamewin[i]?"success":"danger";
        console.log("isWinLabel",isWinLabel);
        isWinType[i] = gamewin[i]?"Win":"Lose";
        console.log("isWinType",isWinType);
		curChampionInfo[i] = getChampionInfoFromKey(mtsl3[i].championId);
        champion_img_url[i] = getLatestDataDragonURL()+"/img/champion/"+curChampionInfo[i].id+".png";
}
const multisearchresult = $('#multi-detail-info-data');
const multise3 = $('#multi_detail_item3');
$('#multi_detail_item3').remove();

	multisearchj3 = `
   <div class="col-xl-6 col-lg-12" style="max-width:13rem;" id="multi_detail_item3">  <!-- 멀티서치 예시 -->
        <div class="card" style="zoom: 1;">
            <div class="card-header no-border">
                <h4 class="card-title">${mtsl3[0].summonerName}<span class="text-muted text-bold-400"></span></h4>
                <a class="heading-elements-toggle"><i class="ft-more-horizontal font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content">
                <div id="deals-list-scroll" class="card-body height-350 position-relative ps-container ps-theme-default" data-ps-id="8d524df2-9cdf-a019-dec2-714633daa2ca">
                    <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[0]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[0].kills}/${mtsl3[0].deaths}/${mtsl3[0].assists}<span class="float-right badge badge-${isWinLabel[0]}">${isWinType[0]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[1]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[1].kills}/${mtsl3[1].deaths}/${mtsl3[1].assists}<span class="float-right badge badge-${isWinLabel[1]}">${isWinType[1]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[2]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[2].kills}/${mtsl3[2].deaths}/${mtsl3[2].assists}<span class="float-right badge badge-${isWinLabel[2]}">${isWinType[2]}</span></p>
                           
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[3]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[3].kills}/${mtsl3[3].deaths}/${mtsl3[3].assists}<span class="float-right badge badge-${isWinLabel[3]}">${isWinType[3]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[4]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[4].kills}/${mtsl3[4].deaths}/${mtsl3[4].assists}<span class="float-right badge badge-${isWinLabel[4]}">${isWinType[4]}</span></p>
                         
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[5]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[5].kills}/${mtsl3[5].deaths}/${mtsl3[5].assists}<span class="float-right badge badge-${isWinLabel[5]}">${isWinType[5]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[6]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[6].kills}/${mtsl3[6].deaths}/${mtsl3[6].assists}<span class="float-right badge badge-${isWinLabel[6]}">${isWinType[6]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[7]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[7].kills}/${mtsl3[7].deaths}/${mtsl3[7].assists}<span class="float-right badge badge-${isWinLabel[7]}">${isWinType[7]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[8]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[8].kills}/${mtsl3[8].deaths}/${mtsl3[8].assists}<span class="float-right badge badge-${isWinLabel[8]}">${isWinType[8]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[9]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl3[9].kills}/${mtsl3[9].deaths}/${mtsl3[9].assists}<span class="float-right badge badge-${isWinLabel[9]}">${isWinType[9]}</span></p>
                          
                        </div>
                    </div>
                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
            </div>
        </div>
    </div>
        `;
        multisearchresult.append(multisearchj3);    
}

//멀티서치 정보를 출력해줌4
function getmultisearchresult4(mtsl4,jun){
 let isWinLabel = [];
 let gamewin = [];
 let isWinType = [];
 let curChampionInfo = [];
 let champion_img_url = [];
for(let i=0;i<mtsl4.length;i++){
		let gamewin = [];
        gamewin[i] = mtsl[i].win;
        isWinLabel[i] = gamewin[i]?"success":"danger";
        isWinType[i] = gamewin[i]?"Win":"Lose";
		curChampionInfo[i] = getChampionInfoFromKey(mtsl4[i].championId);
        champion_img_url[i] = getLatestDataDragonURL()+"/img/champion/"+curChampionInfo[i].id+".png";
}
const multisearchresult = $('#multi-detail-info-data');
const multise4 = $('#multi_detail_item4');
$('#multi_detail_item4').remove();

	multisearchj4 = `
   <div class="col-xl-6 col-lg-12" style="max-width:13rem;" id="multi_detail_item4">  <!-- 멀티서치 예시 -->
        <div class="card" style="zoom: 1;">
            <div class="card-header no-border">
                <h4 class="card-title">${mtsl4[0].summonerName}<span class="text-muted text-bold-400"></span></h4>
                <a class="heading-elements-toggle"><i class="ft-more-horizontal font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content">
                <div id="deals-list-scroll" class="card-body height-350 position-relative ps-container ps-theme-default" data-ps-id="8d524df2-9cdf-a019-dec2-714633daa2ca">
                    <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[0]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[0].kills}/${mtsl4[0].deaths}/${mtsl4[0].assists}<span class="float-right badge badge-${isWinLabel[0]}">${isWinType[0]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[1]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[1].kills}/${mtsl4[1].deaths}/${mtsl4[1].assists}<span class="float-right badge badge-${isWinLabel[1]}">${isWinType[1]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[2]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[2].kills}/${mtsl4[2].deaths}/${mtsl4[2].assists}<span class="float-right badge badge-${isWinLabel[2]}">${isWinType[2]}</span></p>
                           
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[3]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[3].kills}/${mtsl4[3].deaths}/${mtsl4[3].assists}<span class="float-right badge badge-${isWinLabel[3]}">${isWinType[3]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[4]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[4].kills}/${mtsl4[4].deaths}/${mtsl4[4].assists}<span class="float-right badge badge-${isWinLabel[4]}">${isWinType[4]}</span></p>
                         
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[5]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[5].kills}/${mtsl4[5].deaths}/${mtsl4[5].assists}<span class="float-right badge badge-${isWinLabel[5]}">${isWinType[5]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[6]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[6].kills}/${mtsl4[6].deaths}/${mtsl4[6].assists}<span class="float-right badge badge-${isWinLabel[6]}">${isWinType[6]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[7]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[7].kills}/${mtsl4[7].deaths}/${mtsl4[7].assists}<span class="float-right badge badge-${isWinLabel[7]}">${isWinType[7]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[8]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[8].kills}/${mtsl4[8].deaths}/${mtsl4[8].assists}<span class="float-right badge badge-${isWinLabel[8]}">${isWinType[8]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[9]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl4[9].kills}/${mtsl4[9].deaths}/${mtsl4[9].assists}<span class="float-right badge badge-${isWinLabel[9]}">${isWinType[9]}</span></p>
                          
                        </div>
                    </div>
                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
            </div>
        </div>
    </div>
        `;
        multisearchresult.append(multisearchj4); 
}

function getmultisearchresult1(mtsl,jun){
 let isWinLabel = [];
 let gamewin = [];
  let isWinType = [];
 let curChampionInfo = [];
 let champion_img_url = [];
for(let i=0;i<mtsl.length;i++){
		let gamewin = [];
        gamewin[i] = mtsl[i].win;
        console.log("1단계",gamewin);
        isWinLabel[i] = gamewin[i]?"success":"danger";
        console.log("isWinLabel",isWinLabel);
        isWinType[i] = gamewin[i]?"Win":"Lose";
		curChampionInfo[i] = getChampionInfoFromKey(mtsl[i].championId);
        champion_img_url[i] = getLatestDataDragonURL()+"/img/champion/"+curChampionInfo[i].id+".png";
}
const multisearchresult = $('#multi-detail-info-data');
const multise1 = $('#multi_detail_item1');
$('#multi_detail_item1').remove();
$('#multi_detail_item2').remove();
$('#multi_detail_item3').remove();
$('#multi_detail_item4').remove();
$('#multi_detail_item5').remove();

	multisearchj1 = `
   <div class="col-xl-6 col-lg-12" style="max-width:13rem;" id="multi_detail_item1">  <!-- 멀티서치 예시 -->
        <div class="card" style="zoom: 1;">
            <div class="card-header no-border">
                <h4 class="card-title">${mtsl[0].summonerName}<span class="text-muted text-bold-400"></span></h4>
                <a class="heading-elements-toggle"><i class="ft-more-horizontal font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content">
                <div id="deals-list-scroll" class="card-body height-350 position-relative ps-container ps-theme-default" data-ps-id="8d524df2-9cdf-a019-dec2-714633daa2ca">
                    <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[0]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[0].kills}/${mtsl[0].deaths}/${mtsl[0].assists}<span class="float-right badge badge-${isWinLabel[0]}">${isWinType[0]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[1]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[1].kills}/${mtsl[1].deaths}/${mtsl[1].assists}<span class="float-right badge badge-${isWinLabel[1]}">${isWinType[1]}</span></p>
                          
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[2]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[2].kills}/${mtsl[2].deaths}/${mtsl[2].assists}<span class="float-right badge badge-${isWinLabel[2]}">${isWinType[2]}</span></p>
                           
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[3]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[3].kills}/${mtsl[3].deaths}/${mtsl[3].assists}<span class="float-right badge badge-${isWinLabel[3]}">${isWinType[3]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[4]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[4].kills}/${mtsl[4].deaths}/${mtsl[4].assists}<span class="float-right badge badge-${isWinLabel[4]}">${isWinType[4]}</span></p>
                         
                        </div>
                    </div>
                     <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[5]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[5].kills}/${mtsl[5].deaths}/${mtsl[5].assists}<span class="float-right badge badge-${isWinLabel[5]}">${isWinType[5]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[6]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[6].kills}/${mtsl[6].deaths}/${mtsl[6].assists}<span class="float-right badge badge-${isWinLabel[6]}">${isWinType[6]}</span></p>
                           
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[7]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[7].kills}/${mtsl[7].deaths}/${mtsl[7].assists}<span class="float-right badge badge-${isWinLabel[7]}">${isWinType[7]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[8]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[8].kills}/${mtsl[8].deaths}/${mtsl[8].assists}<span class="float-right badge badge-${isWinLabel[8]}">${isWinType[8]}</span></p>
                          
                        </div>
                    </div>
                      <div class="media mb-1">
                        <div class="media-left pr-1">
                            <img class="media-object avatar avatar-md rounded-circle" style="width:30px; height:30px;"  src="${champion_img_url[9]}" alt="Generic placeholder image">
                        </div>
                        <div class="media-body">
                            <p class="text-bold-600 m-0">${mtsl[9].kills}/${mtsl[9].deaths}/${mtsl[9].assists}<span class="float-right badge badge-${isWinLabel[9]}">${isWinType[9]}</span></p>
                          
                        </div>
                    </div>
                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
            </div>
        </div>
    </div>
        `;
        multisearchresult.append(multisearchj1);   
}




function getMultiWinRate1(mtsl){
let winSum = 0;
    for(let i=0;i<mtsl.length;i++){
        const curUserInfo = mtsl[i];
        let isWin = curUserInfo.win;
        if(isWin) winSum+=1;
    	
    }
    let winRate = winSum*100/mtsl.length;
    return {
        winRate: winRate,
        winNum: winSum,
        loseNum: mtsl.length - winSum,
    };
   
}

function getMultiWinRate2(mtsl2){
let winSum = 0;
    for(let i=0;i<mtsl2.length;i++){
        const curUserInfo = mtsl2[i];
        let isWin = curUserInfo.win;
        if(isWin) winSum+=1;
    }
    let winRate = winSum*100/mtsl.length;
    return {
        winRate: winRate,
        winNum: winSum,
        loseNum: mtsl.length - winSum,
    };
   
}	


function getMultiWinRate3(mtsl3){
let winSum = 0;
    for(let i=0;i<mtsl3.length;i++){
        const curUserInfo = mtsl3[i];
        let isWin = curUserInfo.win;
        if(isWin) winSum+=1;
    }
    let winRate = winSum*100/mtsl.length;
    return {
        winRate: winRate,
        winNum: winSum,
        loseNum: mtsl.length - winSum,
    };
   
}	


function getMultiWinRate4(mtsl4){
let winSum = 0;
    for(let i=0;i<mtsl4.length;i++){
        const curUserInfo = mtsl4[i];
        let isWin = curUserInfo.win;
        if(isWin) winSum+=1;
    }
    let winRate = winSum*100/mtsl.length;
    return {
        winRate: winRate,
        winNum: winSum,
        loseNum: mtsl.length - winSum,
    };
   
}	


function getMultiWinRate5(mtsl5){
let winSum = 0;
    for(let i=0;i<mtsl5.length;i++){
        const curUserInfo = mtsl5[i];
        let isWin = curUserInfo.win;
        if(isWin) winSum+=1;
    	
    	
    
    }
    let winRate = winSum*100/mtsl.length;
    return {
        winRate: winRate,
        winNum: winSum,
        loseNum: mtsl.length - winSum,
    };
   
}	


function getConvertedLeagueType(type){
    switch(type){
        case "RANKED_FLEX_SR": return {
            type: "Flex",
            level: 2,
        };
        case "RANKED_SOLO_5x5": return {
            type: "Solo",
            level: 3,
        };
        case "RANKED_TFT_PAIRS": return{
        	type: "TFT",
        	level: 1,
        };
        default: return {
            type: type,
            level: 1,
        };;
    }
}

function getConvertedLeagueTier(tier){
    switch(tier){
        case undefined: return{
        	name: "정보없음",
        	level: 0,
        	color: "#69F",
        };
        case "IRON": return {
            name: "아이언",
            level: 0,
            color: "#999",
        };
        case "BRONZE": return {
            name: "브론즈",
            level: 1,
            color: "#F99",
        };
        case "SILVER": return {
            name: "실버",
            level: 2,
            color: "#CCC",
        };
        case "GOLD": return {
            name: "골드",
            level: 3,
            color: "#FFD700",
        };
        case "PLATINUM": return {
            name: "플레티넘",
            level: 4,
            color: "#7BB",
        };
        case "DIAMOND": return {
            name: "다이아몬드",
            level: 5,
            color: "#67D",
        };
        case "MASTER": return {
            name: "마스터",
            level: 6,
            color: "#B7D",
            color2: "#AAA"
        };
        case "GRANDMASTER": return {
            name: "그랜드마스터",
            level: 7,
            color: "#F44",
            color2: "#777",
        };
        case "CHALLENGER": return {
            name: "챌린저",
            level: 8,
            color: "#69F",
            color2: "#DE8",
        };
        
        default: return tier;
    }
}

function getLatestDataDragonURL(){
    return "https://ddragon.leagueoflegends.com/cdn/"+latestDataDragonVer;
}
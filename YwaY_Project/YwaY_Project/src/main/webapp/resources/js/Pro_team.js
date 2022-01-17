const DebugLevel = false;
let key;
let key2;
let key3;
            
let puuidList = [];
$(document).ready(function(){
	    $.ajax({
	        url: "resources/json/credentials_pro.json?version=12",
	        type: 'GET',
	        dataType: 'json',
	        async: false,
	        success: function(res){
	            console.log("credentials load complete!");
	            console.log(res);
	            key = res.riot_api_key;
	            key2 = res.riot_api_key2;
	            key3 = res.riot_api_key3;
	            puuidList[0] = res.dk1;
	            puuidList[1] = res.dk2;
	            puuidList[2] = res.dk3;
	            puuidList[3] = res.dk4;
	            puuidList[4] = res.dk5;
	            puuidList[5] = res.t1;
	            puuidList[6] = res.t2;
	            puuidList[7] = res.t3;
	            puuidList[8] = res.t4;
	            puuidList[9] = res.t5;
	            puuidList[10] = res.g1;
	            puuidList[11] = res.g2;
	            puuidList[12] = res.g3;
	            puuidList[13] = res.g4;
	            puuidList[14] = res.g5;
	            puuidList[15] = res.a1;
	            puuidList[16] = res.a2;
	            puuidList[17] = res.a3;
	            puuidList[18] = res.a4;
	            puuidList[19] = res.a5;
	            puuidList[20] = res.l1;
	            puuidList[21] = res.l2;
	            puuidList[22] = res.l3;
	            puuidList[23] = res.l4;
	            puuidList[24] = res.l5;
	            puuidList[25] = res.dr1;
	            puuidList[26] = res.dr2;
	            puuidList[27] = res.dr3;
	            puuidList[28] = res.dr4;
	            puuidList[29] = res.dr5;
	            puuidList[30] = res.kt1;
	            puuidList[31] = res.kt2;
	            puuidList[32] = res.kt3;
	            puuidList[33] = res.kt4;
	            puuidList[34] = res.kt5;
	            puuidList[35] = res.br1;
	            puuidList[36] = res.br2;
	            puuidList[37] = res.br3;
	            puuidList[38] = res.br4;
	            puuidList[39] = res.br5;
	            puuidList[40] = res.hl1;
	            puuidList[41] = res.hl2;
	            puuidList[42] = res.hl3;
	            puuidList[43] = res.hl4;
	            puuidList[44] = res.hl5;
	            puuidList[45] = res.ns1;
	            puuidList[46] = res.ns2;
	            puuidList[47] = res.ns3;
	            puuidList[48] = res.ns4;
	            puuidList[49] = res.ns5;
	        },
	        error: function(req, stat, err){
	            console.log(err);
	            console.log("에러");
	        },
	    });

	
    let getLatestDataDragonVersionRequest = $.ajax({
        url: "https://ddragon.leagueoflegends.com/api/versions.json",
        type: "GET",
        dataType: "json",
        success: function(res){
            latestDataDragonVer = res[0];
            let loadInitialDataRequestCallback = [];

            //Load
            $.when.apply(null, loadInitialDataRequestCallback).done(function(){
                	getSummonerInfo(puuidList);
                	getSummonerInfo2(puuidList);
                	getSummonerInfo3(puuidList);
            
            });
        },
    });
});

function getSummonerInfo(puuidList){
for(let i=0;i<20;i++){
    let AfterURL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/"+puuidList[i];
	console.log("AfterURL",AfterURL);
    $.ajax({
        url: AfterURL,
        type: "GET",
        dataType: "json",
        data: {
            "api_key": key,
        },
        success: function(res){
            //Point
            let profileIcon = $('#current_summoner_profile_icon_img_'+i);
            let summonerName = $('#current_summoner_name_'+i);
            let summonerLevel = $('#current_summoner_level_'+i);
            profileIcon.attr("src", getLatestDataDragonURL()+"/img/profileicon/"+res.profileIconId+".png");
		    summonerName.text(res.name);
		    summonerLevel.text(res.summonerLevel);
        },
        error: function(req, stat, err){
            console.log(err);
            if(err == "Not Found") alert("존재하지 않는 소환사");
            else if(err == "Forbidden") alert("API_KEY 만료됨");
        },
    });
   }
}

function getSummonerInfo2(puuidList){
for(let i=20;i<40;i++){
    let AfterURL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/"+puuidList[i];
	console.log("AfterURL",AfterURL);
    $.ajax({
        url: AfterURL,
        type: "GET",
        dataType: "json",
        data: {
            "api_key": key2,
        },
        success: function(res){
            //Point
            let profileIcon = $('#current_summoner_profile_icon_img_'+i);
            let summonerName = $('#current_summoner_name_'+i);
            let summonerLevel = $('#current_summoner_level_'+i);
            profileIcon.attr("src", getLatestDataDragonURL()+"/img/profileicon/"+res.profileIconId+".png");
		    summonerName.text(res.name);
		    summonerLevel.text(res.summonerLevel);
        },
        error: function(req, stat, err){
            console.log(err);
            if(err == "Not Found") alert("존재하지 않는 소환사");
            else if(err == "Forbidden") alert("API_KEY 만료됨");
        },
    });
   }
}


function getSummonerInfo3(puuidList){
for(let i=40;i<50;i++){
    let AfterURL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/"+puuidList[i];
	console.log("AfterURL",AfterURL);
    $.ajax({
        url: AfterURL,
        type: "GET",
        dataType: "json",
        data: {
            "api_key": key3,
        },
        success: function(res){
            //Point
            let profileIcon = $('#current_summoner_profile_icon_img_'+i);
            let summonerName = $('#current_summoner_name_'+i);
            let summonerLevel = $('#current_summoner_level_'+i);
            profileIcon.attr("src", getLatestDataDragonURL()+"/img/profileicon/"+res.profileIconId+".png");
		    summonerName.text(res.name);
		    summonerLevel.text(res.summonerLevel);
        },
        error: function(req, stat, err){
            console.log(err);
            if(err == "Not Found") alert("존재하지 않는 소환사");
            else if(err == "Forbidden") alert("API_KEY 만료됨");
        },
    });
   }
}




function getLatestDataDragonURL(){
    return "https://ddragon.leagueoflegends.com/cdn/"+latestDataDragonVer;
}
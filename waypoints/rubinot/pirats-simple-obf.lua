local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==79) then local v82=0;while true do if (v82==0) then v19=v0(v3(v30,1,1));return "";end end else local v83=v2(v0(v30,16));if v19 then local v90=0;local v91;while true do if (v90==1) then return v91;end if (v90==0) then v91=v5(v83,v19);v19=nil;v90=1;end end else return v83;end end end);local function v20(v31,v32,v33) if v33 then local v84=0 -0 ;local v85;while true do if (v84==(0 -0)) then v85=(v31/((3 -(1271 -(226 + 1044)))^(v32-((2 -0) -1))))%(((2704 -2083) -(555 + 64))^(((v33-1) -(v32-((1997 -(68 + 997)) -(857 + 74)))) + (569 -(367 + 201)))) ;return v85-(v85%(928 -(214 + 713))) ;end end else local v86=0 + 0 ;local v87;while true do if (v86==(0 + 0)) then v87=2^(v32-(878 -(282 + 595))) ;return (((v31%(v87 + v87))>=v87) and (1638 -(1523 + 114))) or (0 + 0) ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + (119 -(32 + 85)) );v18=v18 + 2 + 0 ;return (v36 * (57 + 199)) + v35 ;end local function v23() local v37,v38,v39,v40=v1(v16,v18,v18 + (960 -(892 + 65)) );v18=v18 + (9 -5) ;return (v40 * (31011612 -(14234746 -(87 + 263)))) + (v39 * ((120492 -(67 + 113)) -54776)) + (v38 * 256) + v37 ;end local function v24() local v41=v23();local v42=v23();local v43=1 + 0 ;local v44=(v20(v42,(1 + 1) -1 ,20) * ((2 + 0)^(32 + 0))) + v41 ;local v45=v20(v42,812 -(368 + 423) ,123 -92 );local v46=((v20(v42,50 -(10 + 8) )==(953 -(802 + 150))) and  -((2 + 0) -(773 -(201 + 571)))) or (1 -(1138 -(116 + 1022))) ;if (v45==0) then if (v44==(0 -(0 -0))) then return v46 * (0 + 0) ;else v45=998 -(915 + 82) ;v43=0;end elseif (v45==(5796 -(2201 + 1548))) then return ((v44==(0 + 0)) and (v46 * ((1 -0)/(1187 -(1069 + 118))))) or (v46 * NaN) ;end return v8(v46,v45-(2320 -(4734 -3437)) ) * (v43 + (v44/((3 -1)^(10 + 42)))) ;end local function v25(v47) local v48;if  not v47 then v47=v23();if (v47==(0 -0)) then return "";end end v48=v3(v16,v18,(v18 + v47) -(860 -(814 + 45)) );v18=v18 + v47 ;local v49={};for v66=2 -1 , #v48 do v49[v66]=v2(v1(v3(v48,v66,v66)));end return v6(v49);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v50=0 -0 ;local v51;local v52;local v53;local v54;local v55;local v56;local v57;local v58;local v59;while true do if (v50~=(2 + 0)) then else v55=nil;v56=nil;v50=3;end if (v50~=(1 + 3)) then else v59=nil;while true do if (3~=v51) then else v58=nil;v59=nil;v51=4;end if ((1 + 3)~=v51) then else while true do if (v52~=(1172 -(418 + 753))) then else v55=nil;v56=nil;v52=2;end if (v52==2) then local v100=0;while true do if (v100==1) then v52=2 + 1 ;break;end if ((0 + 0)~=v100) then else v57=nil;v58=nil;v100=1 + 0 ;end end end if (v52==(1 + 2)) then v59=nil;while true do local v101=0;local v102;while true do if (0==v101) then v102=529 -(406 + 123) ;while true do if (v102~=(1769 -(1749 + 20))) then else local v103=0;local v104;while true do if (v103~=(0 + 0)) then else v104=0;while true do if (v104==(1322 -(1249 + 73))) then if (v53~=(1 + 0)) then else local v282=1145 -(466 + 679) ;local v283;while true do if (v282==0) then v283=0 -0 ;while true do if (0~=v283) then else v58=v23();v59={};v283=2 -1 ;end if (v283==(1901 -(106 + 1794))) then local v303=0 + 0 ;while true do if (v303==1) then v283=2;break;end if (v303==(0 + 0)) then for v308=1,v58 do local v309=0;local v310;local v311;local v312;while true do if (v309==1) then v312=nil;while true do if ((0 -0)==v310) then local v321=0 -0 ;while true do if (v321~=0) then else v311=v21();v312=nil;v321=115 -(4 + 110) ;end if (v321~=1) then else v310=585 -(57 + 527) ;break;end end end if (v310~=(1428 -(41 + 1386))) then else if (v311==(104 -(17 + 86))) then v312=v21()~=0 ;elseif (v311==2) then v312=v24();elseif (v311==3) then v312=v25();end v59[v308]=v312;break;end end break;end if (v309==0) then v310=0;v311=nil;v309=1 + 0 ;end end end v57[6 -3 ]=v21();v303=2 -1 ;end end end if (v283==(168 -(122 + 44))) then v53=2 -0 ;break;end end break;end end end if (v53==0) then local v284=0 -0 ;local v285;local v286;while true do if (v284~=1) then else while true do if (v285==(0 + 0)) then v286=0 + 0 ;while true do if (v286==2) then v53=1;break;end if (v286==(0 -0)) then local v305=65 -(30 + 35) ;while true do if (v305~=0) then else v54={};v55={};v305=1;end if (1~=v305) then else v286=1 + 0 ;break;end end end if (v286==1) then local v306=1257 -(1043 + 214) ;local v307;while true do if (v306~=(0 -0)) then else v307=1212 -(323 + 889) ;while true do if (v307==(0 -0)) then local v320=580 -(361 + 219) ;while true do if (v320==(320 -(53 + 267))) then v56={};v57={v54,v55,nil,v56};v320=983 -(18 + 964) ;end if (v320==1) then v307=1;break;end end end if (v307==(3 -2)) then v286=2 + 0 ;break;end end break;end end end end break;end end break;end if ((0 + 0)==v284) then v285=850 -(20 + 830) ;v286=nil;v284=1 + 0 ;end end end v104=1;end if (v104~=(127 -(116 + 10))) then else v102=1;break;end end break;end end end if (v102==(1 + 0)) then if (v53==(740 -(542 + 196))) then local v209=0;local v210;while true do if ((0 -0)~=v209) then else v210=0;while true do if (v210==1) then return v57;end if (v210~=0) then else local v287=0 + 0 ;while true do if (v287~=0) then else for v297=1 + 0 ,v23() do local v298=0 + 0 ;local v299;local v300;while true do if (v298~=(2 -1)) then else while true do if ((0 -0)==v299) then v300=v21();if (v20(v300,1,1552 -(1126 + 425) )~=0) then else local v313=0;local v314;local v315;local v316;local v317;local v318;local v319;while true do if (v313~=(405 -(118 + 287))) then else v314=0 -0 ;v315=nil;v313=1122 -(118 + 1003) ;end if ((2 -1)==v313) then v316=nil;v317=nil;v313=2;end if (v313==(380 -(142 + 235))) then while true do if (v314~=1) then else local v323=0;while true do if (v323==(0 -0)) then v317=nil;v318=nil;v323=1;end if (v323==(1 + 0)) then v314=979 -(553 + 424) ;break;end end end if ((0 -0)==v314) then v315=0;v316=nil;v314=1;end if (v314==(2 + 0)) then v319=nil;while true do if (v315==1) then local v324=0;while true do if (v324==0) then v318=nil;v319=nil;v324=1;end if (v324~=1) then else v315=2;break;end end end if (v315~=(2 + 0)) then else while true do if (v316==(2 + 0)) then local v327=0 + 0 ;local v328;while true do if (0==v327) then v328=0;while true do if ((1 + 0)==v328) then v316=6 -3 ;break;end if (v328==0) then local v337=0 -0 ;while true do if (v337==1) then v328=1;break;end if (v337==0) then local v341=0 -0 ;while true do if (v341==(1 + 0)) then v337=4 -3 ;break;end if (v341==(753 -(239 + 514))) then if (v20(v318,1,1)~=(1 + 0)) then else v319[2]=v59[v319[2]];end if (v20(v318,2,1331 -(797 + 532) )==(1 + 0)) then v319[2 + 1 ]=v59[v319[6 -3 ]];end v341=1;end end end end end end break;end end end if (v316==(1203 -(373 + 829))) then local v329=0;local v330;while true do if (v329~=(731 -(476 + 255))) then else v330=0;while true do if (v330==0) then local v338=0;local v339;while true do if (v338~=0) then else v339=1130 -(369 + 761) ;while true do if (v339~=(1 + 0)) then else v330=1 -0 ;break;end if (v339==(0 -0)) then v319={v22(),v22(),nil,nil};if (v317==0) then local v346=0;local v347;while true do if (v346~=(0 + 0)) then else v347=0;while true do if (v347==0) then v319[3]=v22();v319[4]=v22();break;end end break;end end elseif (v317==(1 -0)) then v319[339 -(144 + 192) ]=v23();elseif (v317==2) then v319[3]=v23() -(2^(232 -(42 + 174))) ;elseif (v317==(3 + 0)) then local v352=0;local v353;while true do if (v352==0) then v353=0 + 0 ;while true do if (v353~=0) then else v319[3]=v23() -(2^(7 + 9)) ;v319[4]=v22();break;end end break;end end end v339=1505 -(363 + 1141) ;end end break;end end end if (v330==1) then v316=2;break;end end break;end end end if (v316==3) then if (v20(v318,3,1583 -(1183 + 397) )==(2 -1)) then v319[4]=v59[v319[4]];end v54[v297]=v319;break;end if (v316==0) then local v332=0 + 0 ;local v333;while true do if (v332~=0) then else v333=0 + 0 ;while true do if (v333==(1976 -(1913 + 62))) then v316=1 + 0 ;break;end if (v333==(0 -0)) then local v340=0;while true do if (v340==0) then v317=v20(v300,1935 -(565 + 1368) ,11 -8 );v318=v20(v300,4,1667 -(1477 + 184) );v340=1;end if (v340==(1 -0)) then v333=1;break;end end end end break;end end end end break;end if ((0 + 0)==v315) then local v325=0;local v326;while true do if (v325==0) then v326=856 -(564 + 292) ;while true do if (v326==0) then local v336=0 -0 ;while true do if (v336==1) then v326=2 -1 ;break;end if ((304 -(244 + 60))==v336) then v316=0 + 0 ;v317=nil;v336=1;end end end if (1~=v326) then else v315=477 -(41 + 435) ;break;end end break;end end end end break;end end break;end if (v313==2) then v318=nil;v319=nil;v313=3;end end end break;end end break;end if (v298~=0) then else v299=0;v300=nil;v298=1002 -(938 + 63) ;end end end for v301=1 + 0 ,v23() do v55[v301-(1126 -(936 + 189)) ]=v28();end v287=1 + 0 ;end if (v287==(1614 -(1565 + 48))) then v210=1 + 0 ;break;end end end end break;end end end break;end end break;end end end break;end if (v52~=(1138 -(782 + 356))) then else v53=267 -(176 + 91) ;v54=nil;v52=1;end end break;end if (v51==(2 -1)) then local v98=0 -0 ;while true do if (1~=v98) then else v51=1094 -(975 + 117) ;break;end if (v98~=(1875 -(157 + 1718))) then else v54=nil;v55=nil;v98=1 + 0 ;end end end if (0==v51) then v52=0 -0 ;v53=nil;v51=1;end if (v51~=(6 -4)) then else local v99=1018 -(697 + 321) ;while true do if (v99==(2 -1)) then v51=3;break;end if (v99==(0 -0)) then v56=nil;v57=nil;v99=2 -1 ;end end end end break;end if ((1 + 0)==v50) then v53=nil;v54=nil;v50=3 -1 ;end if (v50~=3) then else v57=nil;v58=nil;v50=10 -6 ;end if (v50==(1227 -(322 + 905))) then v51=611 -(602 + 9) ;v52=nil;v50=1;end end end local function v29(v60,v61,v62) local v63=v60[1];local v64=v60[2];local v65=v60[3];return function(...) local v68=v63;local v69=v64;local v70=v65;local v71=v27;local v72=1;local v73= -1;local v74={};local v75={...};local v76=v12("#",...) -1 ;local v77={};local v78={};for v88=0,v76 do if (v88>=v70) then v74[v88-v70 ]=v75[v88 + 1 ];else v78[v88]=v75[v88 + 1 ];end end local v79=(v76-v70) + 1 ;local v80;local v81;while true do local v89=0;while true do if (1==v89) then if (v81<=32) then if (v81<=15) then if (v81<=7) then if (v81<=3) then if (v81<=1) then if (v81>0) then v78[v80[2]]={};else local v106=0;local v107;while true do if (v106==0) then v107=v80[2];v78[v107](v78[v107 + 1 ]);break;end end end elseif (v81==2) then v78[v80[2]]=v78[v80[3]][v80[4]];else local v110=v80[2];local v111=v78[v110];for v211=v110 + 1 ,v80[3] do v7(v111,v78[v211]);end end elseif (v81<=5) then if (v81>4) then v78[v80[2]]=v29(v69[v80[3]],nil,v62);else local v113=v80[2];local v114=v78[v113];for v212=v113 + 1 ,v80[3] do v7(v114,v78[v212]);end end elseif (v81==6) then local v115=v80[2];v78[v115](v78[v115 + 1 ]);else do return v78[v80[2]];end end elseif (v81<=11) then if (v81<=9) then if (v81==8) then local v116=v80[2];v78[v116]=v78[v116](v78[v116 + 1 ]);else local v118=v80[2];local v119=v78[v118];local v120=v80[3];for v213=1,v120 do v119[v213]=v78[v118 + v213 ];end end elseif (v81>10) then if  not v78[v80[2]] then v72=v72 + 1 ;else v72=v80[3];end else local v121=0;local v122;local v123;while true do if (v121==1) then for v261=v122 + 1 ,v80[4] do v123=v123   .. v78[v261] ;end v78[v80[2]]=v123;break;end if (v121==0) then v122=v80[3];v123=v78[v122];v121=1;end end end elseif (v81<=13) then if (v81>12) then v78[v80[2]]=v78[v80[3]];else v62[v80[3]]=v78[v80[2]];end elseif (v81>14) then if (v78[v80[2]]==v80[4]) then v72=v72 + 1 ;else v72=v80[3];end else v78[v80[2]]=v80[3];end elseif (v81<=23) then if (v81<=19) then if (v81<=17) then if (v81>16) then local v130=v80[2];v78[v130]=v78[v130](v13(v78,v130 + 1 ,v73));else local v132=v80[2];v78[v132](v13(v78,v132 + 1 ,v80[3]));end elseif (v81>18) then local v133=v80[2];v78[v133]=v78[v133](v78[v133 + 1 ]);else local v135=0;local v136;local v137;local v138;while true do if (v135==1) then v138=v78[v136] + v137 ;v78[v136]=v138;v135=2;end if (v135==2) then if (v137>0) then if (v138<=v78[v136 + 1 ]) then local v288=0;while true do if (v288==0) then v72=v80[3];v78[v136 + 3 ]=v138;break;end end end elseif (v138>=v78[v136 + 1 ]) then v72=v80[3];v78[v136 + 3 ]=v138;end break;end if (v135==0) then v136=v80[2];v137=v78[v136 + 2 ];v135=1;end end end elseif (v81<=21) then if (v81>20) then if (v78[v80[2]]==v78[v80[4]]) then v72=v72 + 1 ;else v72=v80[3];end else local v139=v80[2];v78[v139](v13(v78,v139 + 1 ,v80[3]));end elseif (v81==22) then v72=v80[3];else local v141=0;local v142;local v143;local v144;while true do if (v141==1) then v144=v78[v142 + 2 ];if (v144>0) then if (v143>v78[v142 + 1 ]) then v72=v80[3];else v78[v142 + 3 ]=v143;end elseif (v143<v78[v142 + 1 ]) then v72=v80[3];else v78[v142 + 3 ]=v143;end break;end if (v141==0) then v142=v80[2];v143=v78[v142];v141=1;end end end elseif (v81<=27) then if (v81<=25) then if (v81>24) then v72=v80[3];else local v146=v80[2];v78[v146]=v78[v146](v13(v78,v146 + 1 ,v73));end elseif (v81==26) then v78[v80[2]]=v78[v80[3]][v78[v80[4]]];else for v216=v80[2],v80[3] do v78[v216]=nil;end end elseif (v81<=29) then if (v81>28) then v78[v80[2]][v80[3]]=v78[v80[4]];else v78[v80[2]]=v78[v80[3]];end elseif (v81<=30) then local v154=0;local v155;local v156;while true do if (v154==1) then v78[v155 + 1 ]=v156;v78[v155]=v156[v80[4]];break;end if (0==v154) then v155=v80[2];v156=v78[v80[3]];v154=1;end end elseif (v81==31) then local v229=v80[2];local v230=v78[v229 + 2 ];local v231=v78[v229] + v230 ;v78[v229]=v231;if (v230>0) then if (v231<=v78[v229 + 1 ]) then v72=v80[3];v78[v229 + 3 ]=v231;end elseif (v231>=v78[v229 + 1 ]) then v72=v80[3];v78[v229 + 3 ]=v231;end else v62[v80[3]]=v78[v80[2]];end elseif (v81<=49) then if (v81<=40) then if (v81<=36) then if (v81<=34) then if (v81>33) then v78[v80[2]][v80[3]]=v80[4];else local v159=v80[2];do return v78[v159],v78[v159 + 1 ];end end elseif (v81>35) then v78[v80[2]][v80[3]]=v80[4];else local v162=0;local v163;local v164;local v165;local v166;while true do if (v162==2) then for v262=v163,v73 do v166=v166 + 1 ;v78[v262]=v164[v166];end break;end if (v162==1) then v73=(v165 + v163) -1 ;v166=0;v162=2;end if (v162==0) then v163=v80[2];v164,v165=v71(v78[v163]());v162=1;end end end elseif (v81<=38) then if (v81==37) then do return v78[v80[2]];end elseif (v78[v80[2]]==v80[4]) then v72=v72 + 1 ;else v72=v80[3];end elseif (v81>39) then v78[v80[2]]=v80[3];elseif (v80[2]==v78[v80[4]]) then v72=v72 + 1 ;else v72=v80[3];end elseif (v81<=44) then if (v81<=42) then if (v81>41) then v78[v80[2]]=v29(v69[v80[3]],nil,v62);else local v170=v80[3];local v171=v78[v170];for v218=v170 + 1 ,v80[4] do v171=v171   .. v78[v218] ;end v78[v80[2]]=v171;end elseif (v81==43) then v78[v80[2]]={};else do return;end end elseif (v81<=46) then if (v81>45) then v78[v80[2]]=v80[3]~=0 ;else v78[v80[2]]=v78[v80[3]][v80[4]];end elseif (v81<=47) then v78[v80[2]][v80[3]]=v78[v80[4]];elseif (v81==48) then v78[v80[2]]= #v78[v80[3]];else v78[v80[2]]= #v78[v80[3]];end elseif (v81<=57) then if (v81<=53) then if (v81<=51) then if (v81>50) then v78[v80[2]]=v78[v80[3]][v78[v80[4]]];else local v181=v80[2];local v182={v78[v181](v13(v78,v181 + 1 ,v80[3]))};local v183=0;for v219=v181,v80[4] do local v220=0;while true do if (v220==0) then v183=v183 + 1 ;v78[v219]=v182[v183];break;end end end end elseif (v81>52) then for v221=v80[2],v80[3] do v78[v221]=nil;end else local v184=v80[2];do return v78[v184],v78[v184 + 1 ];end end elseif (v81<=55) then if (v81==54) then local v185=v80[2];local v186=v78[v185];local v187=v78[v185 + 2 ];if (v187>0) then if (v186>v78[v185 + 1 ]) then v72=v80[3];else v78[v185 + 3 ]=v186;end elseif (v186<v78[v185 + 1 ]) then v72=v80[3];else v78[v185 + 3 ]=v186;end else local v188=v80[2];local v189=v78[v188];local v190=v80[3];for v223=1,v190 do v189[v223]=v78[v188 + v223 ];end end elseif (v81>56) then if (v78[v80[2]]==v78[v80[4]]) then v72=v72 + 1 ;else v72=v80[3];end else local v191=0;local v192;local v193;local v194;local v195;while true do if (v191==1) then v73=(v194 + v192) -1 ;v195=0;v191=2;end if (v191==2) then for v271=v192,v73 do v195=v195 + 1 ;v78[v271]=v193[v195];end break;end if (0==v191) then v192=v80[2];v193,v194=v71(v78[v192]());v191=1;end end end elseif (v81<=61) then if (v81<=59) then if (v81==58) then v78[v80[2]]=v80[3]~=0 ;else local v197=v80[2];local v198=v78[v80[3]];v78[v197 + 1 ]=v198;v78[v197]=v198[v80[4]];end elseif (v81>60) then local v202=0;local v203;local v204;local v205;while true do if (v202==1) then v205=0;for v274=v203,v80[4] do v205=v205 + 1 ;v78[v274]=v204[v205];end break;end if (v202==0) then v203=v80[2];v204={v78[v203](v13(v78,v203 + 1 ,v80[3]))};v202=1;end end else do return;end end elseif (v81<=63) then if (v81>62) then if (v80[2]==v78[v80[4]]) then v72=v72 + 1 ;else v72=v80[3];end else local v206=v80[2];do return v13(v78,v206,v206 + v80[3] );end end elseif (v81<=64) then v78[v80[2]]=v62[v80[3]];elseif (v81>65) then v78[v80[2]]=v62[v80[3]];elseif  not v78[v80[2]] then v72=v72 + 1 ;else v72=v80[3];end v72=v72 + 1 ;break;end if (v89==0) then v80=v68[v72];v81=v80[1];v89=1;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!9A3O00028O00026O00184003013O0071025O0086E04003013O0063025O007FDE4003013O006203043O007479706503043O004E4F444503043O007761697403113O0053494E474C455F535445505F44454C4159024O00C07FDE40024O006086E040025O0080DE40024O00C086E040024O002087E040024O008087E040024O00C087E040024O00C080DE40024O002088E040024O004081DE40024O004088E040025O0082DE40024O00A088E040024O008082DE40025O0089E040024O006089E040024O004083DE40025O0084DE40024O004089E040024O00C084DE40024O00A089E040024O00C089E040024O008085DE40024O00208AE040024O00C085DE40024O00808AE040024O00E08AE040024O00408BE040024O00A08BE040024O008086DE40025O008CE040025O0087DE40024O00608CE040024O00C086DE40024O00C08CE040024O00208DE040024O004086DE40024O00808DE040024O00E08DE040025O0086DE40024O004085DE40025O008EE040024O008084DE40024O00208EE040024O00C083DE40024O00808EE040024O00E08EE040025O0083DE40024O00408FE040024O00A08FE040025O0090E040024O00C082DE40024O006090E040024O00A090E040024O002O80DE40024O00407EDE40024O00807DDE40025O007DDE40024O00407CDE40024O00807BDE40024O00C07ADE40024O00407ADE40024O008079DE40024O00C078DE40024O008090E040025O0078DE40024O002090E040024O004077DE40024O008076DE40025O0076DE40024O00608FE040024O004075DE40025O008FE040024O00A08EE040024O00408EE040024O008075DE40024O00C075DE40025O0075DE40024O008089E040024O002089E040024O00C088E040024O006088E040025O0077DE40025O0088E040024O00E087E040024O00C077DE40024O006087E040024O008078DE40024O004087E040024O004079DE40025O0087E040025O007ADE40024O00E086E040024O008086E040025O007CDE40024O00C07CDE40024O004086E04003093O004C4F41445F4441544103083O0068756E744E616D65030E3O00697353696D706C65536372697074030D3O0064656661756C7456616C75657303083O00756E69717565496403093O00574159504F494E5453031B3O0053544F505F5748454E5F4D4F4E535445525F4F4E5F5343522O454E03133O0049474E4F52455F4D4F4E535445525F4C495354030C3O004F544845525F434F4E464947026O00144003063O00436C69656E74030B3O0073686F774D652O7361676503053O00652O726F72026O00F03F03083O0043726561747572652O033O006E657703063O00506C6179657203053O006765744964030B3O00676574566F636174696F6E03053O00456E756D7303093O00566F636174696F6E7303063O004B4E49474854027O0040026O0008403O032O002O2D20456E2D75733A2054727920746F2061766F6964206C6F7374206D6F6E73746572733F204C65617665203020746F2069676E6F72652C203120746F20747279202O2D0A2O2D2050742D62723A2054656E7461722065766974617220646172206C6F7374206E6F73206D6F6E7374726F733F204465697865203020706172612069676E6F7261722C203120706172612074656E746172202O2D0A61766F69644C6F73743D302O0A2O2D20456E2D75733A204D757374206C2O6F7420636F72707365732061726F756E6420796F753F202O2D0A2O2D204C65617665203120746F206C2O6F742C206C65617665203020746F206E6F74206C2O6F742O0A2O2D2050742D62723A2044657665207065676172206C2O6F7420616F20736575207265646F723F202O2D0A2O2D20446569786520312070617261206C2O6F7461722C20646569786520302070617261206E616F206C2O6F7461720A6C2O6F74436F72707365733D302O0A2O2D20456E2D75733A2044656C617920746F206C2O6F7420636F7270736573202O2D0A2O2D2050742D62723A2044656C61792070617261207065676172206C2O6F74202O2D0A2O2D20727562696E4F54203D20302C2069786F6475734F54203D203235300A6C2O6F74436F727073657344656C61793D302O0A2O2D20456E2D75733A20416D6F756E74206F66206D6F6E7374657220746F2073746F7020696E2070726F6772612O6D656420626F78202O2D0A2O2D2050742D62723A205175616E746964616465206465206D6F6E7374726F732070617261207061726172206E6120626F782070726F6772616D616461202O2D0A4D4F4E535445525F544F5F53544152545F424F583D322O0A2O2D20456E2D75733A20416D6F756E74206F66206D6F6E7374657220746F206C6561766520696E2070726F6772612O6D656420626F78202O2D0A2O2D2050742D62723A205175616E746964616465206465206D6F6E7374726F732070617261207361697220646120626F782070726F6772616D616461202O2D0A4D4F4E535445525F544F5F4C454156455F424F583D302O0A026O001040031D3O00682O7470733A2O2F646973636F72642E2O672F774266326D51442O664E03723O00442O4C206E6F7420666F756E642C20706C65617365206F70656E2061207469636B657420696E206F757220646973636F72640A442O4C206E616F20656E636F6E74726164612C20706F72206661766F72206162726120756D207469636B657420656D206E6F2O736F20646973636F72643A20030B3O00736F636B65742E682O7470030D3O007069726174732D73696D706C6503123O0070697261742O73696D706C6544595747594403133O004D41585F4D4F4E535445525F544F5F53544F50026O00204003133O004D494E5F4D4F4E535445525F544F5F4241434B031E3O004D4F4E535445525F4D454449554D5F4C4946455F50455243454E54414745026O002440031B3O0052554E5F415741595F574954485F4D4F4E535445525F434F554E54026O00394003123O004D4F4E535445525F434F554E545F41524541026O001C40030E3O004D41585F535445505F44454C4159025O00409F40026O00594003093O006869766520706F72652O0103113O00706C756E64657220706174726961726368008D022O0012283O00014O0035000100103O00260F3O0027020100020004163O002702012O002B001100234O002B00123O00050030240012000300040030240012000500060030240012000700020030240012000800090030240012000A000B2O002B00133O000500302400130003000400302400130005000C0030240013000700020030240013000800090030240013000A000B2O002B00143O000500302400140003000D00302400140005000E0030240014000700020030240014000800090030240014000A000B2O002B00153O000500302400150003000F00302400150005000E0030240015000700020030240015000800090030240015000A000B2O002B00163O000500302400160003001000302400160005000E0030240016000700020030240016000800090030240016000A000B2O002B00173O000500302400170003001100302400170005000E0030240017000700020030240017000800090030240017000A000B2O002B00183O00050030240018000300120030240018000500130030240018000700020030240018000800090030240018000A000B2O002B00193O00050030240019000300140030240019000500150030240019000700020030240019000800090030240019000A000B2O002B001A3O0005003024001A00030016003024001A00050017003024001A00070002003024001A00080009003024001A000A000B2O002B001B3O0005003024001B00030018003024001B00050019003024001B00070002003024001B00080009003024001B000A000B2O002B001C3O0005003024001C0003001A003024001C00050019003024001C00070002003024001C00080009003024001C000A000B2O002B001D3O0005003024001D0003001B003024001D0005001C003024001D00070002003024001D00080009003024001D000A000B2O002B001E3O0005003024001E0003001B003024001E0005001D003024001E00070002003024001E00080009003024001E000A000B2O002B001F3O0005003024001F0003001E003024001F0005001F003024001F00070002003024001F00080009003024001F000A000B2O002B00203O000500302400200003002000302400200005001F0030240020000700020030240020000800090030240020000A000B2O002B00213O00050030240021000300210030240021000500220030240021000700020030240021000800090030240021000A000B2O002B00223O00050030240022000300230030240022000500240030240022000700020030240022000800090030240022000A000B2O002B00233O00050030240023000300250030240023000500240030240023000700020030240023000800090030240023000A000B2O002B00243O00050030240024000300260030240024000500240030240024000700020030240024000800090030240024000A000B2O002B00253O00050030240025000300270030240025000500240030240025000700020030240025000800090030240025000A000B2O002B00263O00050030240026000300280030240026000500240030240026000700020030240026000800090030240026000A000B2O002B00273O00050030240027000300280030240027000500290030240027000700020030240027000800090030240027000A000B2O002B00283O000500302400280003002A00302400280005002B0030240028000700020030240028000800090030240028000A000B2O002B00293O000500302400290003002C00302400290005002D0030240029000700020030240029000800090030240029000A000B2O002B002A3O0005003024002A0003002E003024002A0005002D003024002A00070002003024002A00080009003024002A000A000B2O002B002B3O0005003024002B0003002F003024002B00050030003024002B00070002003024002B00080009003024002B000A000B2O002B002C3O0005003024002C00030031003024002C00050030003024002C00070002003024002C00080009003024002C000A000B2O002B002D3O0005003024002D00030032003024002D00050033003024002D00070002003024002D00080009003024002D000A000B2O002B002E3O0005003024002E00030032003024002E00050034003024002E00070002003024002E00080009003024002E000A000B2O002B002F3O0005003024002F00030035003024002F00050036003024002F00070002003024002F00080009003024002F000A000B2O002B00303O00050030240030000300370030240030000500380030240030000700020030240030000800090030240030000A000B2O002B00313O000500302400310003003900302400310005001C0030240031000700020030240031000800090030240031000A000B2O002B00323O000500302400320003003A00302400320005003B0030240032000700020030240032000800090030240032000A000B2O002B00333O000500302400330003003C00302400330005003B0030240033000700020030240033000800090030240033000A000B2O002B00343O000500302400340003003D00302400340005003B0030240034000700020030240034000800090030240034000A000B2O002B00353O000500302400350003003E00302400350005003F0030240035000700020030240035000800090030240035000A000B2O002B00363O000500302400360003004000302400360005003F0030240036000700020030240036000800090030240036000A000B2O002B00373O00050030240037000300410030240037000500170030240037000700020030240037000800090030240037000A000B2O002B00383O00050030240038000300410030240038000500150030240038000700020030240038000800090030240038000A000B2O002B00393O00050030240039000300410030240039000500420030240039000700020030240039000800090030240039000A000B2O002B003A3O0005003024003A00030041003024003A0005000C003024003A00070002003024003A00080009003024003A000A000B2O002B003B3O0005003024003B00030040003024003B00050006003024003B00070002003024003B00080009003024003B000A000B2O002B003C3O0005003024003C00030040003024003C00050043003024003C00070002003024003C00080009003024003C000A000B2O002B003D3O0005003024003D00030040003024003D00050044003024003D00070002003024003D00080009003024003D000A000B2O002B003E3O0005003024003E0003003E003024003E00050045003024003E00070002003024003E00080009003024003E000A000B2O002B003F3O0005003024003F0003003E003024003F00050046003024003F00070002003024003F00080009003024003F000A000B2O002B00403O000500302400400003003E0030240040000500470030240040000700020030240040000800090030240040000A000B2O002B00413O000500302400410003003E0030240041000500480030240041000700020030240041000800090030240041000A000B2O002B00423O00050030240042000300400030240042000500490030240042000700020030240042000800090030240042000A000B2O002B00433O000500302400430003004000302400430005004A0030240043000700020030240043000800090030240043000A000B2O00370011003200012O002B00123O000500302400120003004000302400120005004B0030240012000700020030240012000800090030240012000A000B2O002B00133O000500302400130003004C00302400130005004D0030240013000700020030240013000800090030240013000A000B2O002B00143O000500302400140003004E00302400140005004F0030240014000700020030240014000800090030240014000A000B2O002B00153O000500302400150003003E0030240015000500500030240015000700020030240015000800090030240015000A000B2O002B00163O000500302400160003003D0030240016000500510030240016000700020030240016000800090030240016000A000B2O002B00173O00050030240017000300520030240017000500530030240017000700020030240017000800090030240017000A000B2O002B00183O00050030240018000300540030240018000500530030240018000700020030240018000800090030240018000A000B2O002B00193O00050030240019000300550030240019000500530030240019000700020030240019000800090030240019000A000B2O002B001A3O0005003024001A00030056003024001A00050057003024001A00070002003024001A00080009003024001A000A000B2O002B001B3O0005003024001B00030032003024001B00050057003024001B00070002003024001B00080009003024001B000A000B2O002B001C3O0005003024001C00030031003024001C00050058003024001C00070002003024001C00080009003024001C000A000B2O002B001D3O0005003024001D0003002F003024001D00050058003024001D00070002003024001D00080009003024001D000A000B2O002B001E3O0005003024001E0003002E003024001E00050058003024001E00070002003024001E00080009003024001E000A000B2O002B001F3O0005003024001F0003002C003024001F00050059003024001F00070002003024001F00080009003024001F000A000B2O002B00203O000500302400200003002A0030240020000500590030240020000700020030240020000800090030240020000A000B2O002B00213O00050030240021000300280030240021000500590030240021000700020030240021000800090030240021000A000B2O002B00223O00050030240022000300270030240022000500590030240022000700020030240022000800090030240022000A000B2O002B00233O00050030240023000300260030240023000500530030240023000700020030240023000800090030240023000A000B2O002B00243O00050030240024000300250030240024000500530030240024000700020030240024000800090030240024000A000B2O002B00253O00050030240025000300230030240025000500580030240025000700020030240025000800090030240025000A000B2O002B00263O00050030240026000300210030240026000500580030240026000700020030240026000800090030240026000A000B2O002B00273O000500302400270003005A0030240027000500500030240027000700020030240027000800090030240027000A000B2O002B00283O000500302400280003005B0030240028000500500030240028000700020030240028000800090030240028000A000B2O002B00293O000500302400290003005C0030240029000500500030240029000700020030240029000800090030240029000A000B2O002B002A3O0005003024002A0003005D003024002A0005005E003024002A00070002003024002A00080009003024002A000A000B2O002B002B3O0005003024002B0003005F003024002B0005005E003024002B00070002003024002B00080009003024002B000A000B2O002B002C3O0005003024002C00030060003024002C00050061003024002C00070002003024002C00080009003024002C000A000B2O002B002D3O0005003024002D00030011003024002D00050061003024002D00070002003024002D00080009003024002D000A000B2O002B002E3O0005003024002E00030062003024002E00050063003024002E00070002003024002E00080009003024002E000A000B2O002B002F3O0005003024002F00030064003024002F00050065003024002F00070002003024002F00080009003024002F000A000B2O002B00303O00050030240030000300660030240030000500670030240030000700020030240030000800090030240030000A000B2O002B00313O00050030240031000300680030240031000500480030240031000700020030240031000800090030240031000A000B2O002B00323O00050030240032000300680030240032000500470030240032000700020030240032000800090030240032000A000B2O002B00333O000500302400330003006900302400330005006A0030240033000700020030240033000800090030240033000A000B2O002B00343O000500302400340003006900302400340005006B0030240034000700020030240034000800090030240034000A000B2O002B00353O000500302400350003000D0030240035000500440030240035000700020030240035000800090030240035000A000B2O002B00363O000500302400360003006C0030240036000500430030240036000700020030240036000800090030240036000A000B2O002B00373O00050030240037000300040030240037000500060030240037000700020030240037000800090030240037000A000B2O00040011003700022O000D001000114O000D0011000F4O000D001200104O00130011000200022O000D001000114O002B00113O000800101D0011006E000100101D0011006F000200101D00110070000700101D00110071000300101D00110072001000101D00110073000900101D00110074000800101D00110075000A00120C0011006D3O0004163O008C0201000E270076004002013O0004163O00400201000641000E003D020100010004163O003D0201001228001100014O0035001200123O00260F0011002D020100010004163O002D0201001228001200013O00260F00120030020100010004163O00300201001242001300773O0020020013001300782O000D0014000D6O001300020001001242001300794O000D0014000D6O0013000200010004163O003D02010004163O003002010004163O003D02010004163O002D02012O0035000F000F3O00022A000F5O0012283O00023O00260F3O00500201007A0004163O005002010012420011007B3O00200200110011007C0012420012007D3O00200200120012007E2O0038001200014O001800113O00022O000D000400113O00201E00110004007F2O00130011000200022O000D000500113O001242001100803O0020020011001100810020020006001100820012283O00833O00260F3O0056020100840004163O00560201001228000A00854O0035000B000B3O00022A000B00013O0012283O00863O00260F3O0061020100860004163O00610201001228000C00873O001228001100884O000D0012000C4O000A000D001100122O000D0011000B3O001228001200894O00130011000200022O000D000E00113O0012283O00763O00260F3O0067020100010004163O006702010012280001008A4O003A000200013O0012280003008B3O0012283O007A3O00260F3O0002000100830004163O000200012O002B00113O00070006150005006F020100060004163O006F02010012280012008D3O00064100120070020100010004163O007002010012280012008D3O00101D0011008C001200061500050076020100060004163O00760201001228001200013O00064100120077020100010004163O00770201001228001200843O00101D0011008E00120006150005007D020100060004163O007D0201001228001200013O0006410012007E020100010004163O007E0201001228001200903O00101D0011008F00120030240011009100920030240011009300940030240011009500960030240011000B00972O000D000700114O002B00113O00010030240011009800992O000D000800114O002B00113O00010030240011009A00992O000D000900113O0012283O00843O0004163O000200012O003C3O00013O00023O00143O00028O00026O00F03F03053O007461626C6503063O00696E7365727403013O007803013O007103013O007903013O006303013O007A03013O006203043O007479706503043O007761697403093O00646972656374696F6E03063O00616374696F6E03053O006C6162656C030A3O0066696E6454696C65496403093O007573654974656D496403043O006369747903083O0064697374616E6365030B3O00697353616D65466C2O6F7201623O001228000100014O0035000200023O001228000300013O00260F00030003000100010004163O0003000100260F00010008000100020004163O000800012O0007000200023O00260F00010002000100010004163O00020001001228000400013O00260F00040059000100010004163O005900012O002B00056O000D000200053O001228000500024O003000065O001228000700023O000417000500580001001242000900033O0020020009000900042O000D000A00024O002B000B3O000D2O001A000C3O0008002002000C000C000600101D000B0005000C2O001A000C3O0008002002000C000C000800101D000B0007000C2O001A000C3O0008002002000C000C000A00101D000B0009000C2O001A000C3O0008002002000C000C000B00101D000B000B000C2O001A000C3O0008002002000C000C000C00101D000B000C000C2O001A000C3O0008002002000C000C000D000641000C002B000100010004163O002B00012O0035000C000C3O00101D000B000D000C2O001A000C3O0008002002000C000C000E000641000C0031000100010004163O003100012O0035000C000C3O00101D000B000E000C2O001A000C3O0008002002000C000C000F000641000C0037000100010004163O003700012O0035000C000C3O00101D000B000F000C2O001A000C3O0008002002000C000C0010000641000C003D000100010004163O003D00012O0035000C000C3O00101D000B0010000C2O001A000C3O0008002002000C000C0011000641000C0043000100010004163O004300012O0035000C000C3O00101D000B0011000C2O001A000C3O0008002002000C000C0012000641000C0049000100010004163O004900012O0035000C000C3O00101D000B0012000C2O001A000C3O0008002002000C000C0013000641000C004F000100010004163O004F00012O0035000C000C3O00101D000B0013000C2O001A000C3O0008002002000C000C0014000641000C0055000100010004163O005500012O0035000C000C3O00101D000B0014000C2O00140009000B000100041F000500130001001228000400023O00260F0004000B000100020004163O000B0001001228000100023O0004163O000200010004163O000B00010004163O000200010004163O000300010004163O000200012O003C3O00017O00043O00028O00026O00F03F03053O007063612O6C03073O0072657175697265012C3O001228000100014O0035000200043O00260F00010025000100020004163O002500012O0035000400043O001228000500013O00260F00050006000100010004163O0006000100260F0002000B000100020004163O000B00012O0007000400023O00260F00020005000100010004163O00050001001228000600013O00260F00060012000100020004163O00120001001228000200023O0004163O00050001000E270001000E000100060004163O000E0001001242000700033O001242000800044O000D00096O00320007000900082O000D000400084O000D000300073O0006410003001F000100010004163O001F00012O0035000700074O000D000800044O0021000700033O001228000600023O0004163O000E00010004163O000500010004163O000600010004163O000500010004163O002B0001000E2700010002000100010004163O00020001001228000200014O0035000300033O001228000100023O0004163O000200012O003C3O00017O00",v9(),...);
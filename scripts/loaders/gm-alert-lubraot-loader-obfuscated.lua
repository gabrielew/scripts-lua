local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==79) then local v84=0;while true do if (v84==0) then v19=v0(v3(v30,1,1));return "";end end else local v85=0;local v86;while true do if (v85==0) then v86=v2(v0(v30,16));if v19 then local v105=v5(v86,v19);v19=nil;return v105;else return v86;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v87=(v31/((5 -3)^(v32-((1639 -(1523 + 114)) -1))))%((3 -1)^(((v33-(2 -1)) -(v32-(620 -(499 + 56 + 64)))) + (878 -(282 + 595)))) ;return v87-(v87%(932 -(857 + 74))) ;else local v88=(570 -(367 + 201))^(v32-(928 -(214 + 713))) ;return (((v31%(v88 + v88))>=v88) and (1 + 0)) or (0 + (0 -0)) ;end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35=1065 -(68 + 997) ;local v36;local v37;while true do if (v35==(1271 -(226 + 1044))) then return (v37 * (1114 -858)) + v36 ;end if (v35==(0 + 0)) then v36,v37=v1(v16,v18,v18 + (119 -(32 + 85)) );v18=v18 + (959 -(892 + 65)) + 0 ;v35=1;end end end local function v23() local v38=0 -0 ;local v39;local v40;local v41;local v42;while true do if (v38==(1 -0)) then return (v42 * (66680831 -49903615)) + (v41 * (120312 -(55728 -(802 + 150)))) + (v40 * (606 -(87 + 263))) + v39 ;end if (v38==(180 -((180 -113) + 113))) then v39,v40,v41,v42=v1(v16,v18,v18 + 3 + 0 );v18=v18 + (9 -5) ;v38=1 + 0 ;end end end local function v24() local v43=0;local v44;local v45;local v46;local v47;local v48;local v49;while true do if (v43==(1 -0)) then v46=1;v47=(v20(v45,1,15 + 5 ) * (((2137 -(116 + 1022)) -(915 + 82))^(90 -(241 -183)))) + v44 ;v43=2 + 0 + 0 ;end if (v43==(2 -(0 -0))) then v48=v20(v45,21,31);v49=((v20(v45,1219 -((3795 -2726) + 118) )==(2 -1)) and  -(1 -(859 -(814 + 45)))) or 1 ;v43=1 + 2 ;end if (v43==(0 -0)) then v44=v23();v45=v23();v43=1 + 0 ;end if (v43==(794 -(368 + 423))) then if (v48==(0 -(0 -0))) then if (v47==(18 -(10 + 8))) then return v49 * (0 -(0 + 0)) ;else local v106=442 -(416 + 26) ;while true do if (v106==(0 -0)) then v48=1;v46=0 + 0 ;break;end end end elseif (v48==(3621 -(557 + 1017))) then return ((v47==(438 -(145 + (1178 -(261 + 624))))) and (v49 * ((431 -(44 + 386))/(1486 -(998 + 488))))) or (v49 * NaN) ;end return v8(v49,v48-(325 + (1240 -542)) ) * (v46 + (v47/((2 + 0)^(824 -(201 + 571))))) ;end end end local function v25(v50) local v51;if  not v50 then v50=v23();if (v50==0) then return "";end end v51=v3(v16,v18,(v18 + v50) -(1081 -(1020 + 60)) );v18=v18 + v50 ;local v52={};for v68=1424 -(630 + 793) , #v51 do v52[v68]=v2(v1(v3(v51,v68,v68)));end return v6(v52);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v53=0;local v54;local v55;local v56;local v57;local v58;local v59;local v60;local v61;while true do if ((2 + 0)==v53) then local v91=0;while true do if ((851 -(20 + 830))==v91) then v53=3 + 0 ;break;end if (v91==(126 -(116 + 10))) then v58=nil;v59=nil;v91=1;end end end if ((1 + 2)==v53) then local v92=738 -(542 + 196) ;while true do if (1~=v92) then else v53=8 -4 ;break;end if (v92==(0 + 0)) then v60=nil;v61=nil;v92=1 + 0 ;end end end if (v53~=1) then else local v93=0 + 0 ;while true do if (v93==0) then v56=nil;v57=nil;v93=2 -1 ;end if ((2 -1)==v93) then v53=1553 -(1126 + 425) ;break;end end end if (0~=v53) then else local v94=0;while true do if (v94~=0) then else v54=0;v55=nil;v94=1;end if (v94==(406 -(118 + 287))) then v53=3 -2 ;break;end end end if (v53==(1125 -(118 + 1003))) then while true do if (v54==(0 -0)) then local v101=377 -(142 + 235) ;local v102;while true do if (v101==(0 -0)) then v102=0 + 0 ;while true do if (1~=v102) then else v54=1;break;end if (v102==0) then local v110=0;while true do if (v110==1) then v102=1;break;end if (v110~=(977 -(553 + 424))) then else v55=0;v56=nil;v110=1 -0 ;end end end end break;end end end if ((1 + 0)==v54) then v57=nil;v58=nil;v54=2 + 0 ;end if (v54==3) then v61=nil;while true do local v107=0;local v108;local v109;while true do if (v107~=1) then else while true do if (v108~=0) then else v109=0;while true do if ((0 + 0)~=v109) then else local v112=0;local v113;while true do if (v112==0) then v113=0;while true do if (v113==(0 + 0)) then local v341=0;while true do if (v341~=(0 + 0)) then else if ((4 -2)~=v55) then else local v367=0;local v368;while true do if ((0 -0)==v367) then v368=0 -0 ;while true do local v373=0;while true do if (v373~=(0 + 0)) then else if (v368==(0 -0)) then local v382=753 -(239 + 514) ;while true do if (v382==(0 + 0)) then local v383=1329 -(797 + 532) ;while true do if (v383==1) then v382=1 + 0 ;break;end if (v383==0) then for v386=1 + 0 ,v23() do local v387=0;local v388;local v389;local v390;while true do if (1~=v387) then else v390=nil;while true do if (v388~=(0 -0)) then else local v397=1202 -(373 + 829) ;while true do if (v397==1) then v388=732 -(476 + 255) ;break;end if (v397~=(1130 -(369 + 761))) then else v389=0;v390=nil;v397=1 + 0 ;end end end if (1~=v388) then else while true do if (v389~=(0 -0)) then else v390=v21();if (v20(v390,1,1)==0) then local v399=0;local v400;local v401;local v402;local v403;local v404;local v405;while true do if (v399==(3 -1)) then v404=nil;v405=nil;v399=3;end if ((239 -(64 + 174))==v399) then v402=nil;v403=nil;v399=1 + 1 ;end if (v399==(0 -0)) then v400=336 -(144 + 192) ;v401=nil;v399=1;end if ((219 -(42 + 174))~=v399) then else while true do if (0==v400) then local v406=0;while true do if ((1 + 0)==v406) then v400=1;break;end if (v406~=(0 + 0)) then else v401=0 + 0 ;v402=nil;v406=1505 -(363 + 1141) ;end end end if (v400~=(1581 -(1183 + 397))) then else local v407=0 -0 ;while true do if (v407~=1) then else v400=2 + 0 ;break;end if (v407==(0 + 0)) then v403=nil;v404=nil;v407=1976 -(1913 + 62) ;end end end if (v400~=2) then else v405=nil;while true do if (v401==(0 + 0)) then local v408=0;while true do if (v408==0) then v402=0;v403=nil;v408=2 -1 ;end if (v408~=(1934 -(565 + 1368))) then else v401=3 -2 ;break;end end end if (1~=v401) then else local v409=1661 -(1477 + 184) ;while true do if (v409==0) then v404=nil;v405=nil;v409=1 -0 ;end if (v409==1) then v401=2 + 0 ;break;end end end if (v401==2) then while true do if (v402~=(858 -(564 + 292))) then else local v410=0;while true do if (v410~=(0 -0)) then else if (v20(v404,1,2 -1 )~=1) then else v405[306 -(244 + 60) ]=v61[v405[2]];end if (v20(v404,2,2)==1) then v405[3 + 0 ]=v61[v405[3]];end v410=477 -(41 + 435) ;end if (v410~=(1002 -(938 + 63))) then else v402=3 + 0 ;break;end end end if (v402==(1126 -(936 + 189))) then local v411=0;while true do if (v411~=0) then else local v416=0;local v417;while true do if (v416==0) then v417=0;while true do if (v417~=1) then else v411=1;break;end if (v417==0) then local v423=0;while true do if (v423~=1) then else v417=1 + 0 ;break;end if (v423~=0) then else v405={v22(),v22(),nil,nil};if (v403==0) then local v424=1138 -(782 + 356) ;local v425;while true do if (v424==(267 -(176 + 91))) then v425=0;while true do if (v425~=(0 -0)) then else v405[4 -1 ]=v22();v405[1096 -(975 + 117) ]=v22();break;end end break;end end elseif (v403==1) then v405[1878 -(157 + 1718) ]=v23();elseif (v403==(2 + 0)) then v405[3]=v23() -((6 -4)^16) ;elseif (v403~=3) then else local v430=0 -0 ;while true do if ((1018 -(697 + 321))==v430) then v405[3]=v23() -((5 -3)^(33 -17)) ;v405[4]=v22();break;end end end v423=1;end end end end break;end end end if (1~=v411) then else v402=4 -2 ;break;end end end if (v402==0) then local v412=0;while true do if (v412==0) then local v418=0;while true do if (v418==(0 + 0)) then v403=v20(v390,2,3);v404=v20(v390,6 -2 ,6);v418=1;end if (v418~=(2 -1)) then else v412=1228 -(322 + 905) ;break;end end end if (v412~=(612 -(602 + 9))) then else v402=1;break;end end end if (v402==3) then if (v20(v404,1192 -(449 + 740) ,3)~=(873 -(826 + 46))) then else v405[4]=v61[v405[951 -(245 + 702) ]];end v56[v386]=v405;break;end end break;end end break;end end break;end end end break;end end break;end end break;end if (0==v387) then local v393=0 -0 ;while true do if (0==v393) then v388=0;v389=nil;v393=1 + 0 ;end if (1==v393) then v387=1899 -(260 + 1638) ;break;end end end end end for v391=1,v23() do v57[v391-1 ]=v28();end v383=441 -(382 + 58) ;end end end if (v382==1) then v368=3 -2 ;break;end end end if (v368~=1) then else return v59;end break;end end end break;end end end if (1~=v55) then else local v369=0 + 0 ;while true do if (v369==2) then v55=3 -1 ;break;end if (1~=v369) then else local v372=0 -0 ;while true do if (v372==(1206 -(902 + 303))) then v369=2;break;end if (v372==0) then for v375=1 -0 ,v60 do local v376=0 -0 ;local v377;local v378;local v379;local v380;local v381;while true do if ((1 + 0)~=v376) then else v379=nil;v380=nil;v376=1692 -(1121 + 569) ;end if (v376==2) then v381=nil;while true do if ((214 -(22 + 192))~=v377) then else local v384=683 -(483 + 200) ;while true do if (v384==1) then v377=1464 -(1404 + 59) ;break;end if (v384~=(0 -0)) then else v378=0;v379=nil;v384=1 -0 ;end end end if (v377==1) then local v385=765 -(468 + 297) ;while true do if (v385==0) then v380=nil;v381=nil;v385=563 -(334 + 228) ;end if (v385==1) then v377=6 -4 ;break;end end end if (v377~=(4 -2)) then else while true do if (v378==(1 -0)) then v381=nil;while true do if ((1 + 0)==v379) then if (v380==1) then v381=v21()~=(236 -(141 + 95)) ;elseif (v380==2) then v381=v24();elseif (v380==(3 + 0)) then v381=v25();end v61[v375]=v381;break;end if (v379==(0 -0)) then local v395=0 -0 ;local v396;while true do if (v395==(0 + 0)) then v396=0;while true do if (v396==(2 -1)) then v379=1 + 0 ;break;end if (v396~=0) then else local v398=0 + 0 ;while true do if (v398==(0 -0)) then v380=v21();v381=nil;v398=1 + 0 ;end if (v398==(164 -(92 + 71))) then v396=1;break;end end end end break;end end end end break;end if (v378==(0 + 0)) then v379=0 -0 ;v380=nil;v378=766 -(574 + 191) ;end end break;end end break;end if (v376~=0) then else v377=0;v378=nil;v376=1 + 0 ;end end end v59[3]=v21();v372=2 -1 ;end end end if ((0 + 0)~=v369) then else v60=v23();v61={};v369=1;end end end v341=850 -(254 + 595) ;end if (v341==1) then v113=1;break;end end end if (v113==1) then v109=1;break;end end break;end end end if (v109~=(127 -(55 + 71))) then else if (v55==(0 -0)) then local v233=0;local v234;local v235;while true do if (v233==1) then while true do if (v234~=0) then else v235=0;while true do if (v235==0) then local v370=1790 -(573 + 1217) ;while true do if (v370~=1) then else v235=2 -1 ;break;end if (v370==0) then v56={};v57={};v370=1;end end end if (v235==1) then local v371=0;while true do if (v371~=0) then else v58={};v59={v56,v57,nil,v58};v371=1 -0 ;end if (v371==1) then v235=2;break;end end end if (v235~=(941 -(714 + 225))) then else v55=2 -1 ;break;end end break;end end break;end if (v233==(0 -0)) then v234=0 + 0 ;v235=nil;v233=1 -0 ;end end end break;end end break;end end break;end if (v107~=0) then else v108=0;v109=nil;v107=1;end end end break;end if ((808 -(118 + 688))==v54) then local v103=0;local v104;while true do if ((48 -(25 + 23))==v103) then v104=0;while true do if (0~=v104) then else local v111=0 + 0 ;while true do if (v111==1) then v104=1;break;end if (v111==(1886 -(927 + 959))) then v59=nil;v60=nil;v111=3 -2 ;end end end if (v104~=(733 -(16 + 716))) then else v54=3;break;end end break;end end end end break;end end end local function v29(v62,v63,v64) local v65=v62[1];local v66=v62[2];local v67=v62[3];return function(...) local v70=v65;local v71=v66;local v72=v67;local v73=v27;local v74=1;local v75= -1;local v76={};local v77={...};local v78=v12("#",...) -1 ;local v79={};local v80={};for v89=0,v78 do if (v89>=v72) then v76[v89-v72 ]=v77[v89 + 1 ];else v80[v89]=v77[v89 + 1 ];end end local v81=(v78-v72) + 1 ;local v82;local v83;while true do local v90=0;while true do if (v90==1) then if (v83<=31) then if (v83<=15) then if (v83<=7) then if (v83<=3) then if (v83<=1) then if (v83>0) then v80[v82[2]]=v63[v82[3]];else v80[v82[2]]=v80[v82[3]][v82[4]];end elseif (v83>2) then local v118=v82[2];v80[v118]=v80[v118](v80[v118 + 1 ]);else v80[v82[2]]();end elseif (v83<=5) then if (v83==4) then local v120=v82[2];local v121={};for v236=1, #v79 do local v237=0;local v238;while true do if (v237==0) then v238=v79[v236];for v342=0, #v238 do local v343=v238[v342];local v344=v343[1];local v345=v343[2];if ((v344==v80) and (v345>=v120)) then v121[v345]=v344[v345];v343[1]=v121;end end break;end end end else v80[v82[2]]=v80[v82[3]];end elseif (v83==6) then local v124=v82[2];local v125={v80[v124](v13(v80,v124 + 1 ,v75))};local v126=0;for v239=v124,v82[4] do local v240=0;while true do if (v240==0) then v126=v126 + 1 ;v80[v239]=v125[v126];break;end end end else v80[v82[2]][v82[3]]=v80[v82[4]];end elseif (v83<=11) then if (v83<=9) then if (v83==8) then do return v80[v82[2]];end else local v129=v82[2];local v130=v80[v129];local v131=v82[3];for v241=1,v131 do v130[v241]=v80[v129 + v241 ];end end elseif (v83>10) then local v132=0;local v133;local v134;local v135;local v136;while true do if (v132==0) then v133=v82[2];v134,v135=v73(v80[v133](v80[v133 + 1 ]));v132=1;end if (v132==1) then v75=(v135 + v133) -1 ;v136=0;v132=2;end if (v132==2) then for v302=v133,v75 do local v303=0;while true do if (v303==0) then v136=v136 + 1 ;v80[v302]=v134[v136];break;end end end break;end end else local v137=v80[v82[4]];if  not v137 then v74=v74 + 1 ;else local v272=0;while true do if (v272==0) then v80[v82[2]]=v137;v74=v82[3];break;end end end end elseif (v83<=13) then if (v83==12) then local v138=0;local v139;local v140;local v141;while true do if (1==v138) then v141=v82[3];for v304=1,v141 do v140[v304]=v80[v139 + v304 ];end break;end if (v138==0) then v139=v82[2];v140=v80[v139];v138=1;end end else v80[v82[2]]=v80[v82[3]][v82[4]];end elseif (v83==14) then v80[v82[2]]=v82[3];else v80[v82[2]]=v29(v71[v82[3]],nil,v64);end elseif (v83<=23) then if (v83<=19) then if (v83<=17) then if (v83>16) then local v147=v82[2];v80[v147]=v80[v147](v13(v80,v147 + 1 ,v82[3]));else do return v80[v82[2]];end end elseif (v83==18) then local v149=v82[2];do return v13(v80,v149,v149 + v82[3] );end else local v150=v80[v82[4]];if  not v150 then v74=v74 + 1 ;else v80[v82[2]]=v150;v74=v82[3];end end elseif (v83<=21) then if (v83==20) then do return;end else local v151=v82[3];local v152=v80[v151];for v244=v151 + 1 ,v82[4] do v152=v152   .. v80[v244] ;end v80[v82[2]]=v152;end elseif (v83>22) then local v154=v82[2];v80[v154]=v80[v154]();else local v156=v82[2];v80[v156]=v80[v156](v80[v156 + 1 ]);end elseif (v83<=27) then if (v83<=25) then if (v83>24) then v80[v82[2]][v82[3]]=v80[v82[4]];elseif  not v80[v82[2]] then v74=v74 + 1 ;else v74=v82[3];end elseif (v83==26) then local v160=0;local v161;local v162;while true do if (1==v160) then for v307=v161 + 1 ,v82[4] do v162=v162   .. v80[v307] ;end v80[v82[2]]=v162;break;end if (v160==0) then v161=v82[3];v162=v80[v161];v160=1;end end else v80[v82[2]]=v63[v82[3]];end elseif (v83<=29) then if (v83>28) then v80[v82[2]]={};else v80[v82[2]]=v82[3];end elseif (v83>30) then v80[v82[2]]={};elseif  not v80[v82[2]] then v74=v74 + 1 ;else v74=v82[3];end elseif (v83<=47) then if (v83<=39) then if (v83<=35) then if (v83<=33) then if (v83>32) then local v169=v82[2];local v170={v80[v169](v80[v169 + 1 ])};local v171=0;for v245=v169,v82[4] do local v246=0;while true do if (v246==0) then v171=v171 + 1 ;v80[v245]=v170[v171];break;end end end else local v172=0;local v173;local v174;local v175;local v176;while true do if (v172==0) then v173=v82[2];v174,v175=v73(v80[v173](v80[v173 + 1 ]));v172=1;end if (1==v172) then v75=(v175 + v173) -1 ;v176=0;v172=2;end if (v172==2) then for v310=v173,v75 do v176=v176 + 1 ;v80[v310]=v174[v176];end break;end end end elseif (v83>34) then v74=v82[3];else local v178=v82[2];local v179=v82[4];local v180=v178 + 2 ;local v181={v80[v178](v80[v178 + 1 ],v80[v180])};for v247=1,v179 do v80[v180 + v247 ]=v181[v247];end local v182=v181[1];if v182 then v80[v180]=v182;v74=v82[3];else v74=v74 + 1 ;end end elseif (v83<=37) then if (v83==36) then local v183=v82[2];v80[v183](v80[v183 + 1 ]);else v80[v82[2]]();end elseif (v83==38) then local v184=0;local v185;local v186;local v187;while true do if (v184==1) then v187=0;for v313=v185,v82[4] do v187=v187 + 1 ;v80[v313]=v186[v187];end break;end if (v184==0) then v185=v82[2];v186={v80[v185](v13(v80,v185 + 1 ,v82[3]))};v184=1;end end else local v188=0;local v189;while true do if (v188==0) then v189=v82[2];do return v80[v189],v80[v189 + 1 ];end break;end end end elseif (v83<=43) then if (v83<=41) then if (v83>40) then local v190=v71[v82[3]];local v191;local v192={};v191=v10({},{__index=function(v250,v251) local v252=0;local v253;while true do if (v252==0) then v253=v192[v251];return v253[1][v253[2]];end end end,__newindex=function(v254,v255,v256) local v257=v192[v255];v257[1][v257[2]]=v256;end});for v259=1,v82[4] do local v260=0;local v261;while true do if (v260==0) then v74=v74 + 1 ;v261=v70[v74];v260=1;end if (v260==1) then if (v261[1]==5) then v192[v259-1 ]={v80,v261[3]};else v192[v259-1 ]={v63,v261[3]};end v79[ #v79 + 1 ]=v192;break;end end end v80[v82[2]]=v29(v190,v191,v64);else v80[v82[2]]=v29(v71[v82[3]],nil,v64);end elseif (v83>42) then local v195=v82[2];v80[v195]=v80[v195](v13(v80,v195 + 1 ,v82[3]));else local v197=0;local v198;local v199;while true do if (v197==1) then for v319=1, #v79 do local v320=v79[v319];for v348=0, #v320 do local v349=v320[v348];local v350=v349[1];local v351=v349[2];if ((v350==v80) and (v351>=v198)) then v199[v351]=v350[v351];v349[1]=v199;end end end break;end if (v197==0) then v198=v82[2];v199={};v197=1;end end end elseif (v83<=45) then if (v83==44) then if v80[v82[2]] then v74=v74 + 1 ;else v74=v82[3];end elseif (v80[v82[2]]==v82[4]) then v74=v74 + 1 ;else v74=v82[3];end elseif (v83==46) then if (v80[v82[2]]==v82[4]) then v74=v74 + 1 ;else v74=v82[3];end else v80[v82[2]]=v64[v82[3]];end elseif (v83<=55) then if (v83<=51) then if (v83<=49) then if (v83>48) then local v202=0;local v203;local v204;local v205;while true do if (v202==0) then v203=v82[2];v204={v80[v203](v80[v203 + 1 ])};v202=1;end if (v202==1) then v205=0;for v321=v203,v82[4] do v205=v205 + 1 ;v80[v321]=v204[v205];end break;end end else v74=v82[3];end elseif (v83==50) then local v207=v82[2];local v208=v82[4];local v209=v207 + 2 ;local v210={v80[v207](v80[v207 + 1 ],v80[v209])};for v262=1,v208 do v80[v209 + v262 ]=v210[v262];end local v211=v210[1];if v211 then local v282=0;while true do if (v282==0) then v80[v209]=v211;v74=v82[3];break;end end else v74=v74 + 1 ;end else v80[v82[2]]=v80[v82[3]];end elseif (v83<=53) then if (v83>52) then local v214=v82[2];v80[v214]=v80[v214]();else local v216=0;local v217;local v218;local v219;while true do if (v216==0) then v217=v82[2];v218={v80[v217](v13(v80,v217 + 1 ,v82[3]))};v216=1;end if (1==v216) then v219=0;for v324=v217,v82[4] do v219=v219 + 1 ;v80[v324]=v218[v219];end break;end end end elseif (v83>54) then local v220=v82[2];v80[v220](v80[v220 + 1 ]);else do return;end end elseif (v83<=59) then if (v83<=57) then if (v83>56) then local v221=v82[2];do return v80[v221],v80[v221 + 1 ];end else v80[v82[2]]=v64[v82[3]];end elseif (v83==58) then for v265=v82[2],v82[3] do v80[v265]=nil;end else local v224=v82[2];local v225={v80[v224](v13(v80,v224 + 1 ,v75))};local v226=0;for v267=v224,v82[4] do local v268=0;while true do if (v268==0) then v226=v226 + 1 ;v80[v267]=v225[v226];break;end end end end elseif (v83<=61) then if (v83>60) then if v80[v82[2]] then v74=v74 + 1 ;else v74=v82[3];end else local v227=v82[2];local v228=v80[v227];for v269=v227 + 1 ,v82[3] do v7(v228,v80[v269]);end end elseif (v83>62) then local v229=0;local v230;local v231;local v232;while true do if (v229==0) then v230=v71[v82[3]];v231=nil;v229=1;end if (v229==2) then for v329=1,v82[4] do v74=v74 + 1 ;local v330=v70[v74];if (v330[1]==5) then v232[v329-1 ]={v80,v330[3]};else v232[v329-1 ]={v63,v330[3]};end v79[ #v79 + 1 ]=v232;end v80[v82[2]]=v29(v230,v231,v64);break;end if (v229==1) then v232={};v231=v10({},{__index=function(v332,v333) local v334=0;local v335;while true do if (v334==0) then v335=v232[v333];return v335[1][v335[2]];end end end,__newindex=function(v336,v337,v338) local v339=v232[v337];v339[1][v339[2]]=v338;end});v229=2;end end else for v270=v82[2],v82[3] do v80[v270]=nil;end end v74=v74 + 1 ;break;end if (v90==0) then v82=v70[v74];v83=v82[1];v90=1;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!1B3O00028O00026O00104003183O00676D2D616C6572742D6C756272616F742D6F62662E6C756103053O00706169727303053O007063612O6C03043O006C6F616403043O007479706503083O0066756E6374696F6E03053O00652O726F72026O000840031D3O00682O7470733A2O2F646973636F72642E2O672F774266326D51442O664E026O00F03F03723O00442O4C206E6F7420666F756E642C20706C65617365206F70656E2061207469636B657420696E206F757220646973636F72640A442O4C206E616F20656E636F6E74726164612C20706F72206661766F72206162726120756D207469636B657420656D206E6F2O736F20646973636F72643A20034F3O00452O726F72206F6E206C6F61642066696C652C20706C656173652074727920616761696E2120496620706572736973742C206F70656E2061207469636B657420696E206F757220646973636F72640A03663O00452O726F20616F2063612O7265676172206F206172717569766F2C20706F72206661766F722074656E7465206E6F76616D656E746521205365207065727369737469722C206162726120756D207469636B657420656D206E6F2O736F20646973636F72643A20030B3O00736F636B65742E682O7470027O004003073O007061636B61676503043O0070617468030A3O005C642O6C735F6C69625C03093O006C75615C3F2E6C7561030E3O006C75615C3F5C696E69742E6C756103103O006C75615C736F636B65745C3F2E6C756103053O00637061746803053O003F2E642O6C03063O00436C69656E74030B3O0073686F774D652O7361676500B33O00120E3O00014O003A000100083O00262D3O003B000100020004303O003B00012O001D000900013O00120E000A00034O000C0009000100012O0033000800093O001238000900044O0033000A00084O003100090002000B0004303O0038000100120E000E00014O003A000F00103O00262D000E000E000100010004303O000E00012O0033001100064O0033001200074O00330013000D4O0020001200134O000600113O00122O0033001000124O0033000F00113O00062C000F003300013O0004303O0033000100120E001100014O003A001200133O00262D0011001B000100010004303O001B0001001238001400053O001238001500064O00330016000F4O00260014001600152O0033001300154O0033001200143O00062C0012002D00013O0004303O002D0001001238001400074O0033001500134O001600140002000200262D0014002D000100080004303O002D00012O0033001400134O00020014000100010004303O00380001001238001400094O0033001500044O00240014000200010004303O003800010004303O001B00010004303O00380001001238001100094O0033001200104O00240011000200010004303O003800010004303O000E00010006320009000C000100020004303O000C00010004303O00B1000100262D3O00420001000A0004303O0042000100063F00063O000100012O00053O00054O003A000700073O000228000700013O00120E3O00023O00262D3O0048000100010004303O004800012O003A000100013O000228000100023O00120E0002000B3O00120E3O000C3O00262D3O00560001000C0004303O0056000100120E0009000D4O0033000A00024O001500030009000A00120E0009000E3O00120E000A000F4O0033000B00024O001500040009000B2O0033000900013O00120E000A00104O00160009000200022O0033000500093O00120E3O00113O00262D3O0002000100110004303O0002000100061E000500A0000100010004303O00A0000100120E000900014O003A000A000E3O00262D00090095000100110004303O009500012O003A000E000E3O00262D000A006B000100110004303O006B000100063F000E0003000100012O00053O000B3O001238000F00124O00330010000E4O00330011000C3O001238001200123O00202O0012001200132O002B001000120002001019000F0013001000120E000A000A3O00262D000A0075000100010004303O0075000100120E000B00144O001D000F00033O00120E001000153O00120E001100163O00120E001200174O000C000F000300012O0033000C000F3O00120E000A000C3O00262D000A00830001000A0004303O00830001001238000F00124O00330010000E4O00330011000D3O001238001200123O00202O0012001200182O002B001000120002001019000F001800102O0033000F00013O00120E001000104O0016000F000200022O00330005000F3O0004303O009F000100262D000A005F0001000C0004303O005F000100120E000F00013O00262D000F008A0001000C0004303O008A000100120E000A00113O0004303O005F000100262D000F0086000100010004303O008600012O001D001000013O00120E001100194O000C0010000100012O0033000D00104O003A000E000E3O00120E000F000C3O0004303O008600010004303O005F00010004303O009F000100262D000900990001000C0004303O009900012O003A000C000D3O00120E000900113O00262D0009005C000100010004303O005C000100120E000A00014O003A000B000B3O00120E0009000C3O0004303O005C00012O000400095O00061E000500AE000100010004303O00AE000100120E000900013O00262D000900A3000100010004303O00A30001001238000A001A3O00202O000A000A001B2O0033000B00034O0024000A00020001001238000A00094O0033000B00034O0024000A000200010004303O00AE00010004303O00A300012O003A000600063O00120E3O000A3O0004303O000200012O00048O00143O00013O00043O00063O00028O00026O00F03F03073O0072657175657374026O00694003383O004661696C656420746F20646F776E6C6F6164207468652066696C653A0A46616C686120616F20626169786172206F206172717569766F3A0A03143O00756E6B6E6F776E0A646573636F6E68656369646F01223O00120E000100014O003A000200043O00262D00010007000100010004303O0007000100120E000200014O003A000300033O00120E000100023O00262D00010002000100020004303O000200012O003A000400043O00262D0002000A000100010004303O000A00012O000100055O00202O0005000500032O003300066O00310005000200062O0033000400064O0033000300053O00262D00040016000100040004303O001600012O0008000300023O0004303O002100012O003A000500053O00120E000600053O0006130007001B000100040004303O001B000100120E000700064O00150006000600072O0027000500033O0004303O002100010004303O000A00010004303O002100010004303O000200012O00143O00017O00013O00033D3O00682O7470733A2O2F7261772E67697468756275736572636F6E74656E742E636F6D2F6761627269656C65772F736372697074732D6C75612F6D61696E2F01053O00120E000100014O003300026O00150001000100022O0008000100024O00143O00017O00043O00028O00026O00F03F03053O007063612O6C03073O007265717569726501153O00120E000100014O003A000200033O00262D00010005000100020004303O000500012O0008000300023O00262D00010002000100010004303O00020001001238000400033O001238000500044O003300066O00260004000600052O0033000300054O0033000200043O00061E00020012000100010004303O001200012O003A000400044O0033000500034O0027000400033O00120E000100023O0004303O000200012O00143O00017O00043O0003063O0069706169727303013O003B03063O00456E67696E6503133O00676574536372697074734469726563746F727902114O0033000200013O001238000300014O003300046O00310003000200050004303O000D00012O0033000800023O00120E000900023O001238000A00033O00202O000A000A00042O0035000A000100022O0001000B6O0033000C00074O001500020008000C00063200030005000100020004303O000500012O0008000200024O00143O00017O00",v9(),...);
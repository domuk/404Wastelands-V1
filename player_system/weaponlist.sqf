//Display name, Class name, Price of gun, Magazine, Price of magazine

weaponsArray = [
        //<editor-fold desc="Rifles">
	["AK-74","AK_74",50,"30Rnd_545x39_AK",10],
	["AK-107 Kobra","AK_107_kobra",75,"30Rnd_545x39_AK",10],
        ["AKM","AK_47_M",75,"30Rnd_762x39_AK47",10],
        ["M16A4","M16A4",75,"30Rnd_556x45_Stanag",10],
        ["M4A1","M4A1",50,"30Rnd_556x45_Stanag",10],
        ["M4A1 CCO","M4A1_Aim",100,"30Rnd_556x45_Stanag",10],
        //</editor-fold>
        //<editor-fold desc="Shotguns">
        ["M1014","M1014",50,"8Rnd_B_Beneli_74Slug",10],
        ["Saiga 12K","Saiga 12K",100,"8Rnd_B_Saiga12_74Slug",10],
        //</editor-fold>
        //<editor-fold desc="Light Machine Guns">
        ["M249","M249_EP1",250,"200Rnd_556x45_M249",50],
        ["Mk_48 Mod","Mk_48",250,"100Rnd_762x51_M240",25],
        ["M240","M240",250,"100Rnd_762x51_M240",25],
        ["Pecheneg","Pecheneg",250,"100Rnd_762x54_PK",25],
        //</editor-fold>
        //<editor-fold desc="Launchers">
        ["RPG-7","RPG7V",300,"PG7V",100],
        ["SMAW","SMAW",300,"SMAW_HEAA",100],
        ["Stinger","Stinger",1000,"Stinger",250],
        ["Javelin","Javelin",1500,"Javelin",500],
        //</editor-fold>
        //<editor-fold desc="Snipers">
        ["Mk12 SPR","M4SPR",200,"20Rnd_556x45_Stanag",10],
        ["Mk17 Sniper","SCAR_H_LNG_Sniper",500,"20Rnd_762x51_B_SCAR",25],
        ["Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",750,"20Rnd_762x51_SB_SCAR",25],
        ["M110 NV","M110_NVG_EP1",1000,"20Rnd_762x51_B_SCAR",25],
        ["Mk17 Sniper TWS","SCAR_H_STD_TWS_SD",1500,"20Rnd_762x51_SB_SCAR",25],
        ["M107","m107",2000,"10Rnd_127x99_m107",50],
        ["M110 TWS","M110_TWS_EP1",2500,"20Rnd_762x51_B_SCAR",25],
        //</editor-fold>
        //<editor-fold desc="Accessories">
        ["Range Finder","Binocular_Vector",500],
	["NV Goggles","NVGoggles",100]
        //</editor-fold>
];

weaponSell = [
	["M16A2",10],
	["M16A2GL",10],
	["m16a4",10],
	["M16A4_GL",10],
	["M4A1",10],
	["M4A1_Aim",10],
	["M4A1_Aim_camo",10],
	["M4A1_RCO_GL",10],
	["M4A1_AIM_SD_camo",25],
	["M4A1_HWS_GL_SD_Camo",25],
	["M4A1_HWS_GL",10],
	["M4A1_HWS_GL_camo",10],
	["MP5SD",5],
	["MP5A5",5],
	["G36C",10],
	["G36_C_SD_eotech",25],
	["G36a",10],
	["G36K",10],
	["MG36",25],
	["AK_47_M",10],
	["AK_47_S",10],
	["AKS_GOLD",25],
	["AK_74",10],
	["AK_74_GL",10],
	["AK_107_kobra",10],
	["AK_107_GL_kobra",10],
	["AKS_74_kobra",10],
	["AKS_74_U",10],
	["AKS_74_UN_kobra",10],
	["RPK_74",25],
	["bizon",5],
	["bizon_silenced",25],
	["M1014",10],
	["Saiga12K",10],
	["G36_C_SD_camo",25],
	["SCAR_H_CQC_CCO",10],
	["SCAR_H_CQC_CCO_SD",25],
	["SCAR_L_CQC",10],
	["SCAR_L_CQC_CCO_SD",25],
	["M4A3_CCO_EP1",10],
	["FN_FAL",25],
	["Sa58P_EP1",10],
	["Sa58V_EP1",10],
	["Sa58V_CCO_EP1",10],
	["AA12_PMC",10],
	["astr_AG",10],
	["BAF_L85A2_RIS_Holo",10],
	["BAF_L85A2_UGL_Holo",10],
	["AK_74_GL_kobra",10],
	["AKS_74",10],
	["G36C_camo",10],
	["G36A_camo",10],
	["G36K_camo",10],
	["MG36_camo",10],
	["M32_EP1",10],
	["M79_EP1",10],
	["Mk13_EP1",10],
	["LeeEnfield",10],
	["M14_EP1",10],
	["SCAR_L_CQC_Holo",10],
	["SCAR_L_CQC_EGLM_Holo",25],
	["SCAR_L_STD_HOLO",10],
	["m16a4_acg",10],
	["M16A4_ACG_GL",10],
	["M24",25],
	["M40A3",25],
	["M4SPR",25],
	["SVD",25],
	["SVD_CAMO",25],
	["AK_107_GL_pso",10],
	["AK_107_pso",10],
	["AKS_74_pso",10],
	["DMR",25],
	["VSS_vintorez",25],
	["SCAR_H_LNG_Sniper_SD",25],
	["BAF_L86A2_ACOG",25],
	["BAF_AS50_scoped",1000],
	["BAF_LRR_scoped",25],
	["Sa58V_RCO_EP1",25],
	["m8_carbine",25],
	["m8_carbineGL",25],
	["m8_compact",25],
	["m8_sharpshooter",25],
	["m8_SAW",25],
	["huntingrifle",25],
	["BAF_LRR_scoped_W",150],
	["BAF_L85A2_RIS_SUSAT",150],
	["BAF_L85A2_UGL_SUSAT",175],
	["BAF_L85A2_RIS_ACOG",160],
	["BAF_L85A2_UGL_ACOG",175],
	["BAF_L85A2_RIS_CWS",150],
	["M24_des_EP1",125],
	["SVD_des_EP1",125],
	["SVD_NSPU_EP1",125],
	["M4A3_RCO_GL_EP1",25],
	["AKS_74_NSPU",25],
	["FN_FAL_ANPVS4",25],
	["M110_NVG_EP1",500],
	["SCAR_L_STD_Mk4CQT",25],
	["SCAR_L_STD_EGLM_RCO",25],
	["SCAR_L_STD_EGLM_TWS",25],
	["SCAR_H_STD_EGLM_Spect",25],
	["SCAR_H_LNG_Sniper",250],
	["PMC_AS50_scoped",1000],
	["m8_carbine_pmc",125],
	["m8_compact_pmc",125],
	["m8_holo_sd",125],
	["M240",100],
	["Mk_48",100],
	["M249",100],
	["PK",100],
	["Pecheneg",100],
	["ksvk",1000],
	["m107",1000],
	["BAF_L110A1_Aim",125],
	["M60A4_EP1",100],
	["astr_negev",100],
	["astr_mg3",125],
	["BAF_L7A2_GPMG",100],
	["Mk_48_DES_EP1",100],
	["M249_EP1",100],
	["M249_TWS_EP1",1000],
	["M249_m145_EP1",100],
	["m240_scoped_EP1",100],
	["M9",25],
	["M9SD",20],
	["Makarov",15],
	["MakarovSD",25],
	["Colt1911",15],
	["glock17_EP1",15],
	["Sa61_EP1",50],
	["UZI_EP1",50],
	["UZI_SD_EP1",40],
	["revolver_EP1",75],
	["revolver_gold_EP1",10],
	["M136",1],
	["Javelin",650],
	["Stinger",1],
	["RPG7V",50],
	["Strela",1],
	["Igla",1],
	["MetisLauncher",1],
	["BAF_NLAW_Launcher",1],
	["RPG18",100],
	["SMAW",1],
	["M47Launcher_EP1",1],
	["MAAWS",1],
	["M9",25],
	["M9SD",20],
	["Makarov",15],
	["MakarovSD",30],
	["Colt1911",15],
	["glock17_EP1",15],
	["Sa61_EP1",50],
	["UZI_EP1",50],
	["UZI_SD_EP1",40],
	["revolver_EP1",75],
	["revolver_gold_EP1",10],
	["NVGoggles",50]
];
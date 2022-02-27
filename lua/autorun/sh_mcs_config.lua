--[[---------------------------------------------------------------------------
Multi Character System By Studio FCS [Jo57430]
---------------------------------------------------------------------------
M.C.S. S-FCS(Jo57430(©Copyright))
--DarkRP Addons--
-----------------
--- Commande: ---
/change      | Alterable Ligne 48
/mcs_options | Config  Allowed Job/Auter Config
---------------------------------------------------------------------------]]
-- Versions --
Versions = "8.0"

--[[-----------------------------------------------------------------------
Configuration
---------------------------------------------------------------------------]]
-- Logo --
FCS_MCS_Config = {} -- DON'T TOUCH

FCS_MCS_Config["nameon"] = true -- Display Serveur Name ?
FCS_MCS_Config["name"] = "Test Serveur 123456" --Serveur Name
FCS_MCS_Config["timeon"] = true -- Display Time
FCS_MCS_Config["dateon"] = true -- Display Date

FCS_MCS_Config["logo"] = "SliceTest.png" --Logo
FCS_MCS_Config["imgerror"] = "vgui/avatar_default" --Logo Error
FCS_MCS_Config["effect"] = "mcs/gui/cam3.1.png" --BackEffect
-- Commande --
FCS_MCS_Config["comchange"] = "/change" --Commande Chat

-- Spawn --
FCSMCSConfig = {} -- DON'T TOUCH
FCSMCSConfig.Text = {} -- DON'T TOUCH

FCSMCSConfig.spawnPos = Vector(6, -289, -11917) --Spawn BackGound (X Y Z)
FCSMCSConfig.spawnAng = Angle(46, 90, 0) --Spawn BackGound Angle
FCSMCSConfig.sound = "/bmff_ambuance/music/ele3sound.wav" -- Spawn ambuance sound

-- Config Valeur --
FCS_MCS_ConfigValues = {} -- DON'T TOUCH

FCS_MCS_ConfigValues["description"] = true --Déscription On(true)/Off(false)
FCS_MCS_ConfigValues_HUD_Size = 50 -- Size of the description (Type 1: 20 /Type 2: 50 )
FCS_MCS_ConfigValues_HUD_Type = 2 -- Type 1 or 2 
FCS_MCS_ConfigValues["CharMax"] = 3 
FCS_MCS_ConfigValues["LastPos"] = false --Last Pos
FCS_MCS_ConfigValues["ShowWindow"] = "f2" --f1/f2/f3/f4 Open menu
FCS_MCS_ConfigValues["Default"] = {1} --Default Job 
FCS_MCS_ConfigValues["StartMoney"] = 500 --Start Monney
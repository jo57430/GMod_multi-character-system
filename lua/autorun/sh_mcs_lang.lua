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
FCS_MCS_LangRegions = {} -- DON'T TOUCH
--[[-----------------------------------------------------------------------
-- Change Language --
---------------------
"En" --English
"Fr" --Français
"Custom" --Create your own configuration
---------------------------------------------------------------------------]]

FCS_MCS_LangRegions = "Fr"

---------------------------------------------------------------------------
if(FCS_MCS_LangRegions == "Custom")then -----------------------------------
--[[-----------------------------------------------------------------------
		\|/ Custom Config \|/ --Create your own configuration
---------------------------------------------------------------------------]]
FCS_MCS_Config["Select Character"] = "" --Select Character
FCS_MCS_Config["Select"] = "" --Select
FCS_MCS_Config["Load"] = "" --Load
FCS_MCS_Config["Create"] = "" --Create
FCS_MCS_Config["Description"] = "" --Description
FCS_MCS_Config["DescDe"] = "" --Description of :
FCS_MCS_Config["Delete"] = "" --Delete
FCS_MCS_Config["Disconnect"] = "" --Disconnect
FCS_MCS_Config["Back"] = "" --Back
FCS_MCS_Config["Close"] = "" --Close
FCS_MCS_Config["Name"] = "" --Name
FCS_MCS_Config["Job"] = "" --Job
FCS_MCS_Config["SelectJob"] = "" --Select Job
FCS_MCS_Config["Default Job"] = "" --Default Job
FCS_MCS_Config["Word"] = "" --Word
FCS_MCS_Config["Translation"] = "" --Translation
FCS_MCS_Config["Accept"] = "" --Accept
FCS_MCS_Config["Save"] = "" --Save
FCS_MCS_Config["Reset"] = "" --Reset
FCS_MCS_Config["Add/Delete"] = "" --Add/Delete
---------------------------------------------------------------------------
end -----------------------------------------------------------------------
--[[-----------------------------------------------------------------------
		\|/ DON'T TOUCH \|/
---------------------------------------------------------------------------]]
--[[-----------------------------------------------------------------------
-- Langage -- "En" --English
---------------------------------------------------------------------------]]
if(FCS_MCS_LangRegions == "En")then
FCS_MCS_Config["Select Character"] = "Select Character"
FCS_MCS_Config["Select"] = "Select"
FCS_MCS_Config["Load"] = "Load"
FCS_MCS_Config["Create"] = "Create"
FCS_MCS_Config["Description"] = "Description"
FCS_MCS_Config["DescDe"] = "Description of : "
FCS_MCS_Config["Delete"] = "Delete"
FCS_MCS_Config["Disconnect"] = "Disconnect"
FCS_MCS_Config["Back"] = "Back"
FCS_MCS_Config["Close"] = "Close"
FCS_MCS_Config["Name"] = "Name"
FCS_MCS_Config["Job"] = "Job : "
FCS_MCS_Config["SelectJob"] = "Select Job : "
FCS_MCS_Config["Default Job"] = "Default Job"
FCS_MCS_Config["Word"] = "Word"
FCS_MCS_Config["Translation"] = "Translation"
FCS_MCS_Config["Accept"] = "Accept"
FCS_MCS_Config["Save"] = "Save"
FCS_MCS_Config["Reset"] = "Reset"
FCS_MCS_Config["Add/Delete"] = "Add/Delete"
end
--[[-----------------------------------------------------------------------
-- Langage -- "Fr" --Français
---------------------------------------------------------------------------]]
if(FCS_MCS_LangRegions == "Fr")then
FCS_MCS_Config["Select Character"] = "Sélectionnez un personnage"
FCS_MCS_Config["Select"] = "Sélectionner"
FCS_MCS_Config["Load"] = "Chargée"
FCS_MCS_Config["Create"] = "Créer"
FCS_MCS_Config["Description"] = "Description"
FCS_MCS_Config["DescDe"] = "Description de : "
FCS_MCS_Config["Delete"] = "Effacer"
FCS_MCS_Config["Disconnect"] = "Déconnecter"
FCS_MCS_Config["Back"] = "Retour"
FCS_MCS_Config["Close"] = "Fermer"
FCS_MCS_Config["Name"] = "Nom"
FCS_MCS_Config["Job"] = "Emploi : "
FCS_MCS_Config["SelectJob"] = "Emploi sélectionnée : "
FCS_MCS_Config["Default Job"] = "Emploi par défaut"
FCS_MCS_Config["Word"] = "Mot"
FCS_MCS_Config["Translation"] = "Traduction"
FCS_MCS_Config["Accept"] = "Acceptez"
FCS_MCS_Config["Save"] = "Sauvegarder"
FCS_MCS_Config["Reset"] = "Réinitialiser"
FCS_MCS_Config["Add/Delete"] = "Ajouter/Supprimer"
end
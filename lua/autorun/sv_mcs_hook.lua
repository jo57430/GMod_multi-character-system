hook.Add( "PlayerSay", "BMcharCmdChat", function( ply, text, public )
	if(!table.HasValue({"/f1","/f2","/f3","/f4"},string.lower( text )))then
		if ( string.lower( text ) == string.lower("/"..FCS_MCS_ConfigValues["ShowWindow"]) ) then
			ply:SetNWBool("SelectChar",true)
			ply:changeTeam(1,true,true)
			ply:Spawn()
			return ""
		end
	end
	
-----------------------------------------------------------------------------
-- Commande -- Menu Switch Charateur
-----------------------------------------------------------------------------
	if ( string.lower( text ) == string.lower(FCS_MCS_Config["comchange"]) ) then
			ply:SetNWBool("SelectChar",true)
			ply:changeTeam(1,true,true)
			ply:Spawn()
	end
	
-----------------------------------------------------------------------------
-- Commande -- Config Panel (Lang/Value) Désactivé
-----------------------------------------------------------------------------
--[[-- 
	if ( string.lower( text ) == string.lower("/mcs_value") ) then
		if(ply:IsSuperAdmin())then
			umsg.Start("charlang", ply)
			umsg.End()
			return ""
		end
	end
--]]--
-----------------------------------------------------------------------------
-- Commande -- Config Panel (Options)
-----------------------------------------------------------------------------	
	if ( string.lower( text ) == string.lower("/mcs_options") ) then
		if(ply:IsSuperAdmin())then
			umsg.Start("charoptions", ply)
			umsg.End()
			return ""
		end
	end
end )
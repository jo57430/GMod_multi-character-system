util.AddNetworkString("AppDesc")
util.AddNetworkString("Desc")
util.AddNetworkString("OpenSimpleDesc")


net.Receive("AppDesc", function(len, ply)
	local ent = net.ReadEntity()
	local str = net.ReadString()
	ply:SetNWString("DescriptionLine1",str)
	file.CreateDir( "sfcs_descdata" )
	file.Write( "sfcs_descdata/"..ply:SteamID64().."_"..ply:Name().."_desc.txt", str )
end)




hook.Add( "PlayerSpawn", "SpawnSetDesc", function( ply)
	if file.Exists( "sfcs_descdata/"..ply:SteamID64().."_"..ply:Name().."_desc.txt", "DATA" ) then
	local str = file.Read( "sfcs_descdata/"..ply:SteamID64().."_"..ply:Name().."_desc.txt", "DATA" )
		ply:SetNWString("DescriptionLine1",str)
		else
		ply:SetNWString("DescriptionLine1"," ")
	end
end)

hook.Add( "PlayerSay", "FindTextDesc", function( ply, text, team )
	if text == command then 
	net.Start("OpenSimpleDesc")
	net.WriteEntity(ply)
	net.Send(ply)
	return ""
	end
end )
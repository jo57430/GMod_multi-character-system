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
--[[-----------------------------------------------------------------------
Configuration
-------------
The config Files is:

sh_mcs_config.lua -- For Variable/Other
sh_mcs_lang.lua   -- Langage

---------------------------------------------------------------------------
		\|/ DON'T TOUCH \|/
---------------------------------------------------------------------------]]
-- Langage --
FCS_MCS_Config = {} -- DON'T TOUCH
FCS_MCS_LangRegions = {} -- DON'T TOUCH
-- Spawn --
FCSMCSConfig = {} -- DON'T TOUCH
FCSMCSConfig.Text = {} -- DON'T TOUCH

-- Config Valeur --
FCS_MCS_ConfigValues = {} -- DON'T TOUCH
FCS_MCS_ConfigValues_def = {} -- DON'T TOUCH 

include('sh_mcs_config.lua')
include('code')
include('sh_mcs_lang.lua')
include('sv_mcs_hook.lua')

--[[-----------------------------------------------------------------------
Chargement
---------------------------------------------------------------------------]]
function MCSloadMsg(msg)
	Msg("Studio FCS Script Id: 0026: "..tostring(msg).."\n")
end
MCSloadMsg(tostring("\n ========================================== \n Chargement...\n ========================================== \n Multi Character Systeme \n By Studio F.C.S. \n Créateur du scripte : Jo57430 \n Versions : "..Versions.." \n"))

--[[-----------------------------------------------------------------------
Fond + Logo
---------------------------------------------------------------------------]]

if(CLIENT)then
surface.CreateFont( "FD", { font = "DermaLarge", size = ScrW()/88.4, weight = 700 } )
surface.CreateFont( "FDL", { font = "DermaLarge", size = ScrW()/147.3, weight = 700 } )
surface.CreateFont( "HUD_D", { font = "ChatFont", size = FCS_MCS_ConfigValues_HUD_Size, weight = 100, antialias = 1 } )
surface.CreateFont( "BL", { font = "BudgetLabel", size = ScrW()/70, weight = 700 } )

function charselect ()
	local ply = LocalPlayer()
	local CharData = string.Explode( "<|>", ply:GetPData( "BM_char", "" ) )
	local CharID = 0
	local JobID = 1
	local JobModels = RPExtraTeams[JobID].model
	local ModelsIcon = {}
	local NewCharModel = ""
	
--[[-----------------------------------------------------------------------
Close Frame
---------------------------------------------------------------------------]]
	local cf = vgui.Create( "DFrame" )
	cf:SetPos( 0,0 )
	cf:SetSize( ScrW(), ScrH() )
	cf:SetVisible( true )
	cf:SetTitle( "" )
	cf:SetDraggable( false )
    cf:ShowCloseButton(false)
	cf:MakePopup()
	cf.Paint = function()
		surface.SetDrawColor( 1, 1, 1, 255 )
		surface.DrawRect( 0, 0, cf:GetWide(), cf:GetTall() )
	end
		cf:AlphaTo( 0, 3, 0,function()
	end)
	
	
--[[-----------------------------------------------------------------------
Frame
---------------------------------------------------------------------------]]	
	
	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 0,0 )
	frame:SetSize( ScrW(), ScrH() )
	frame:SetTitle( "SId : 0026 | Versions : "..Versions.." | By Studio FCS" )
	frame:SetVisible( true )
	frame:SetDraggable( false )
    frame:ShowCloseButton(false)
	frame:MakePopup()
	frame.Paint = function()
		surface.SetDrawColor( 68, 68, 68, 120 )
		surface.DrawRect( 0, 0, frame:GetWide(), frame:GetTall() )
		
		if(FCS_MCS_Config["nameon"] == true )then
			surface.SetFont( "BL" )
			surface.SetTextColor( Color( 240, 240, 240 ) )
			surface.SetTextPos((ScrW()/1.091)-(string.len(FCS_MCS_Config["name"])*(ScrW()/334)), ScrH()/1.17)
			surface.DrawText(FCS_MCS_Config["name"])
		end
		if(FCS_MCS_Config["timeon"] == true )then
		surface.SetFont( "BL" )
        surface.SetTextColor( Color( 240, 240, 240 ) )
        surface.SetTextPos( ScrW()/1.12, ScrH()/1.135 )
        surface.DrawText(os.date( "%H:%M:%S" ))
		end
		if(FCS_MCS_Config["dateon"] == true )then
		surface.SetFont( "BL" )
        surface.SetTextColor( Color( 240, 240, 240 ) )
        surface.SetTextPos( ScrW()/1.13, ScrH()/1.10 )
        surface.DrawText(os.date( "%d/%m/20%y"))
		end
	end
	
local effect = vgui.Create( "DImage", frame )
	effect:SetPos( 0,0 )
	effect:SetSize( ScrW(), ScrH() )
    effect:SetImage( FCS_MCS_Config["effect"], FCS_MCS_Config["imgerror"] )
	
	local slogo = vgui.Create( "DImage", effect )
	slogo:AlignTop(5)
	slogo:AlignLeft(ScrW()/2-(ScrW()/4.42)/2)
	slogo:SetSize( ScrW()/4.42, ScrH()/4.96 )
    slogo:SetImage( FCS_MCS_Config["logo"], FCS_MCS_Config["imgerror"] )
	
	local bgb = vgui.Create( "DPanel", frame )
	bgb:AlignTop(ScrW()/7.22)
	bgb:AlignLeft(ScrH()/198.4)
	bgb:SetSize(ScrW()/8.82, ScrH()/3.2)
	bgb.Paint = function()
		draw.RoundedBox( 8, 0, 0, bgb:GetWide(), bgb:GetTall(), Color( 150, 150, 150, 0 ) )
	end
		
--[[-----------------------------------------------------------------------
Close Windowe butons
---------------------------------------------------------------------------]]
	local closepp = vgui.Create( "DPanel", frame )
	closepp:AlignTop(ScrW()/4)
	closepp:AlignLeft(ScrH()/99.2)
	closepp:SetSize( ScrW()/8.84, ScrH()/19.84  )
	closepp.Paint = function()
		draw.RoundedBox( 8, 0, 0, closepp:GetWide(), closepp:GetTall(), Color( 0, 0, 0, 0 ) )
	end
	closepp:Hide()

--[[-----------------------------------------------------------------------
Menu 1 (Load)
---------------------------------------------------------------------------]]
	local panel = vgui.Create( "DPanel", frame )
	panel:AlignTop(ScrW()/7.072)
	panel:AlignLeft(ScrH()/4.5)
	panel:SetSize(ScrW()/2.253,ScrH()/1.984)
	panel.Paint = function()
		draw.RoundedBox( 8, 0, 0, panel:GetWide(), panel:GetTall(), Color( 0, 0, 0, 100 ) )
	end
	panel:Hide()
	
	local panell = vgui.Create( "DPanel", panel )
	panell:AlignTop(0)
	panell:AlignLeft(ScrH()/4.84) -- 205
	panell:SetSize(ScrW()/3.05,ScrH()/1.984) -- 580, 500
	panell.Paint = function()
		draw.RoundedBox( 8, 0, 0, panell:GetWide(), panell:GetTall(), Color( 100, 100, 100, 200 ) )
	end
	
	local charlist = vgui.Create("DListView")
	charlist:SetParent(panel)
	charlist:SetPos(ScrW()/8.42,ScrH()/198.4) --210; 5
	charlist:SetSize(ScrW()/5.9,ScrH()/2.02) --300, 490
	charlist:SetMultiSelect(false)
	charlist:SetSortable(false)
	charlist.Paint = function()
		surface.SetDrawColor( 120, 120, 120, 150 )
		surface.DrawRect( 0, 0, charlist:GetWide(), charlist:GetTall() )
	end
	charlist:SetDataHeight(30)
	charlist:AddColumn(FCS_MCS_Config["Select Character"])
	
	if(string.len(CharData[1]) == 0)then
		table.Empty( CharData )
	end
	for k, v in pairs(CharData) do
		local dane = string.Explode( "<?>", v )
		charlist:AddLine( dane[1], k, dane[4] )
	end
	
	local bg2 = vgui.Create( "DPanel", panel )
	bg2:SetPos(ScrW()/3.4,ScrH()/198.4) --520. 5
	bg2:SetSize(ScrW()/7.072,ScrH()/2.02) -- 250, 490 
	bg2.Paint = function()
		surface.SetDrawColor( 0, 0, 0, 150 )
		surface.DrawRect( 0, 0, bg2:GetWide(), bg2:GetTall() )
	end
	
	local SelectModel2 = vgui.Create( "DModelPanel" , bg2 )
	SelectModel2:SetPos( 0, 0 )
	SelectModel2:SetSize(ScrW()/7.072,ScrH()/2.02) -- 250, 490 
	SelectModel2:SetModel( "models/combine_soldier_anims.mdl" )
	SelectModel2:SetCamPos( Vector( -45, 0, 45 ) )
	SelectModel2:SetFOV( ScrW()/35 ) --50
	
	charlist.OnRowSelected = function( lst, index, pnl )
		CharID = tonumber(pnl:GetColumnText( 2 ))
		SelectModel2:SetModel( pnl:GetColumnText( 3 ) )
	end
	
	local loadbutton = vgui.Create("DButton")
	loadbutton:SetParent( panel )
	loadbutton:SetText( FCS_MCS_Config["Select"] )
	loadbutton:SetPos(ScrW()/353.6,ScrH()/198.4) -- 5 . 5
	loadbutton:SetSize( ScrW()/8.84, ScrH()/19.84  )
	loadbutton:SetFont( "FD" )
	loadbutton:SetColor( Color( 0, 150, 0, 255 ) )
	loadbutton.DoClick = function ()
		if(CharID > 0)then
			ply:ConCommand( "stopsound" )
			
			cf:AlphaTo(255,1,0,function()
				frame:AlphaTo( 0, 0.5, 0,function()
					net.Start( "BMCharSend" )
					net.WriteTable( {"LOAD",CharData[CharID]} )
					net.SendToServer()
					panel:Hide()
						cf:AlphaTo( 0, 2, 0,function()
						frame:Close()
						cf:Close()
					end)
				end)
			end)
		end
	end	
		loadbutton.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 80)
		surface.DrawRect( 0, 0, loadbutton:GetWide(), loadbutton:GetTall() )
	end
	
	local delbutton = vgui.Create("DButton")
	delbutton:SetParent( panel )
	delbutton:SetText( FCS_MCS_Config["Delete"] )
	delbutton:SetPos(ScrW()/353.6,ScrH()/3.968) --5 . 250
	delbutton:SetSize( ScrW()/8.84, ScrH()/19.84  )
	delbutton:SetFont( "FD" )
	delbutton:SetColor( Color( 150, 0, 0, 255 ) )
	delbutton.DoClick = function ()
		if(CharID > 0)then
			net.Start( "BMCharSend" )
			net.WriteTable( {"DELETE",CharID} )
			net.SendToServer()
		end
		CharID = 0
		charlist:Clear()
		timer.Simple( 0.5, function()
		CharData = string.Explode( "<|>", ply:GetPData( "BM_char", "" ) )
		if(string.len(CharData[1]) == 0)then
			table.Empty( CharData )
		end
		SelectModel2:SetModel( "models/combine_soldier_anims.mdl" )
			for k, v in pairs(CharData) do
				local dane = string.Explode( "<?>", v )
				charlist:AddLine( dane[1], k, dane[4] )
			end
		end)
	end
		delbutton.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 80)
		surface.DrawRect( 0, 0, delbutton:GetWide(), delbutton:GetTall() )
	end

--[[-----------------------------------------------------------------------
Menu 2 (Create)
---------------------------------------------------------------------------]]
	local panel2 = vgui.Create( "DPanel", frame )
	panel2:AlignTop(ScrW()/7.072) --ScrW()/353.6,ScrH()/3.968
	panel2:AlignLeft(ScrH()/4.51)
	panel2:SetSize( ScrW()/3.1, ScrH()/1.73 )
	panel2.Paint = function()
		draw.RoundedBox( 8, 0, 0, panel2:GetWide(), panel2:GetTall(), Color( 200, 200, 200, 0 ) )
	end
	panel2:Hide()
	
	local panell2 = vgui.Create( "DPanel", panel2 )
	panell2:AlignTop(ScrW()/32.15)
	panell2:AlignLeft(ScrH()/353.6)
	panell2:SetSize( ScrW()/3.185, ScrH()/2.31 )
	panell2.Paint = function()
		draw.RoundedBox( 8, 0, 0, panell2:GetWide(), panell2:GetTall(), Color( 100, 100, 100, 200 ) )
	end
	
	local name = vgui.Create( "DTextEntry", panel2 )
	name:SetPos(ScrW()/353.5, ScrH()/16.5 )
	name:SetTall( ScrW()/88.4 )
	name:SetWide( ScrH()/1.82 )
	name:SetEnterAllowed( true )
	name:SetText( FCS_MCS_Config["Name"] )
	
	local desc = vgui.Create( "DTextEntry", panel2 )
	if( FCS_MCS_ConfigValues["description"] == true )then
		desc:SetPos(ScrW()/353.5, ScrH()/11.67)
		desc:SetTall( ScrW()/88.4 )
		desc:SetWide( ScrH()/1.82 )
		desc:SetEnterAllowed( true )
		desc:SetText(FCS_MCS_Config["Description"])
		desc.OnTextChanged = function(self)
			TheDescStr = desc:GetValue()
		end 
		desc.OnEnter = function(self)
			TheDescStr = desc:GetValue()
		end
	end
	
	local ScrollModels = vgui.Create( "DScrollPanel", panel2 )
	ScrollModels:SetSize(ScrW()/7.69, ScrH()/2.02 )
	ScrollModels:SetPos(ScrW()/44.2, ScrH()/6.02)
	
	local bg1 = vgui.Create( "DPanel", panel2 )
	bg1:SetPos(ScrW()/5.9, ScrH()/9.02 )
	bg1:SetSize(ScrW()/7.072, ScrH()/2.68 )
	bg1.Paint = function()
		surface.SetDrawColor( 0, 0, 0, 150 )
		surface.DrawRect( 0, 0, bg1:GetWide(), bg1:GetTall() )
	end
	
	local SelectModel = vgui.Create( "DModelPanel" , bg1 )
	SelectModel:SetPos( 0, 0 )
	SelectModel:SetSize(ScrW()/8.36, ScrH()/2.61)
	SelectModel:SetModel( JobModels[1] )
	SelectModel:SetCamPos( Vector( -45, 0, 45 ) )
	SelectModel:SetFOV( ScrW()/35 ) --50 
	
	if(table.Count(JobModels) >= 4)then
	for k,v in pairs(JobModels) do
	if((k/4 - math.Round(k/4))==0)then
		for i=1,4 do 
			ModelsIcon[k-(4-i)] = vgui.Create( "SpawnIcon" , ScrollModels )
			ModelsIcon[k-(4-i)]:SetPos( -(ScrW()/29.47)+(i*(ScrW()/29.47)), -(ScrW()/29.47)+((k/4)*(ScrW()/29.47)) ) -- (ScrW()/29.47) = 60
			ModelsIcon[k-(4-i)]:SetSize( (ScrW()/29.47), (ScrW()/29.47) )
			ModelsIcon[k-(4-i)]:SetModel( JobModels[k-(4-i)] )
			ModelsIcon[k-(4-i)].DoClick = function ()
				SelectModel:SetModel( JobModels[k-(4-i)] )
				NewCharModel = JobModels[k-(4-i)]
			end
		end
	end
	end
	else
		for q,w in pairs(JobModels) do
			ModelsIcon[q] = vgui.Create( "SpawnIcon" , ScrollModels )
			ModelsIcon[q]:SetPos( -(ScrW()/29.47)+(q*(ScrW()/29.47)), 0) -- (ScrW()/29.47) = 60
			ModelsIcon[q]:SetSize( (ScrW()/29.47), (ScrW()/29.47) )
			ModelsIcon[q]:SetModel( JobModels[q] )
			ModelsIcon[q].DoClick = function ()
				SelectModel:SetModel( JobModels[q] )
				NewCharModel = JobModels[q]
			end
		end
	end
	
	local TeamButton = vgui.Create("DButton")
	TeamButton:SetParent( panel2 )
	TeamButton:SetFont( "FDL" )
	TeamButton:SetText( FCS_MCS_Config["SelectJob"].." ("..team.GetName( JobID )..")" )
	TeamButton:SetPos(ScrW()/8.036, 0)
	TeamButton:SetSize(ScrW()/5.28, ScrH()/19.84 )
	TeamButton:SetColor( Color( 180, 20, 20, 255 ) )
	TeamButton.DoClick = function ( btn )
		local TeamButtonOptions = DermaMenu()
		for k,v in pairs(FCS_MCS_ConfigValues["Default"]) do
			TeamButtonOptions:AddOption(team.GetName( v ), function() 
				JobID = v
				TeamButton:SetText( FCS_MCS_Config["Job"].." ("..team.GetName( JobID )..")" )
				if(istable( RPExtraTeams[JobID].model ))then
					JobModels = RPExtraTeams[JobID].model
				else
					JobModels = {RPExtraTeams[JobID].model}
				end
				
				for q,w in pairs(ModelsIcon) do
					w:Remove()
				end
				
				SelectModel:SetModel( JobModels[1] )
				
				if(table.Count(JobModels) >= 4)then
					for q,w in pairs(JobModels) do
						if((q/4 - math.Round(q/4))==0)then
							for i=1,4 do 
								ModelsIcon[q-(4-i)] = vgui.Create( "SpawnIcon" , ScrollModels )
								ModelsIcon[q-(4-i)]:SetPos( -(ScrW()/29.47)+(i*(ScrW()/29.47)), -(ScrW()/29.47)+((q/4)*(ScrW()/29.47)) ) -- (ScrW()/29.47) = 60
								ModelsIcon[q-(4-i)]:SetSize( (ScrW()/29.47), (ScrW()/29.47) )
								ModelsIcon[q-(4-i)]:SetModel( JobModels[q-(4-i)] )
								ModelsIcon[q-(4-i)].DoClick = function ()
									SelectModel:SetModel( JobModels[q-(4-i)] )
									NewCharModel = JobModels[q-(4-i)]
								end
							end
						end
					end
				else
					for q,w in pairs(JobModels) do
						ModelsIcon[q] = vgui.Create( "SpawnIcon" , ScrollModels )
						ModelsIcon[q]:SetPos( -(ScrW()/29.47)+(q*(ScrW()/29.47)), 0) -- (ScrW()/29.47) = 60
						ModelsIcon[q]:SetSize( (ScrW()/29.47), (ScrW()/29.47) )
						ModelsIcon[q]:SetModel( JobModels[q] )
						ModelsIcon[q].DoClick = function ()
							SelectModel:SetModel( JobModels[q] )
							NewCharModel = JobModels[q]
						end
					end
				end
				
			end )
		end
		TeamButtonOptions:Open()
	end
	TeamButton.Paint = function()
		surface.SetDrawColor( 110, 110, 110, 100)
		surface.DrawRect( 0, 0, TeamButton:GetWide(), TeamButton:GetTall() )
	end
	
	local createbut = vgui.Create("DButton")
	createbut:SetParent( panel2 )
	createbut:SetText( FCS_MCS_Config["Create"] )
	createbut:SetPos(0, 0)
	createbut:SetSize( ScrW()/8.84, ScrH()/19.84  )
	createbut:SetFont( "FD" )
	createbut:SetColor( Color( 0, 150, 0, 255 ) )
	createbut.DoClick = function ()
		if( FCS_MCS_ConfigValues["description"] == true )then
			if(string.len(name:GetValue()) >= 3 && name:GetValue() != FCS_MCS_Config["Name"] && string.len(desc:GetValue()) >= 10 && desc:GetValue() != FCS_MCS_Config["Description"])then
				ply:ConCommand( "stopsound" )

				cf:AlphaTo(255,1,0,function()
					frame:AlphaTo( 0, 0.5, 0,function()
					net.Start( "BMCharSend" )
					net.WriteTable( {"CREATE",name:GetValue(),JobID,NewCharModel} )
					net.SendToServer()
					net.Start( "AppDesc" )
					net.WriteEntity( LocalPlayer() )
					net.WriteString( TheDescStr )
					net.SendToServer()
					panel2:Hide()
						cf:AlphaTo( 0, 2, 0,function()
							frame:Close()
							cf:Close()
						end)
					end)
				end)
			end
		else
			if(string.len(name:GetValue()) >= 3 && name:GetValue() != FCS_MCS_Config["Name"] )then
				net.Start( "BMCharSend" )
				net.WriteTable( {"CREATE",name:GetValue(),JobID,NewCharModel} )
				net.SendToServer()
				frame:Close()
			end
		end
	end
		createbut.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 80)
		surface.DrawRect( 0, 0, createbut:GetWide(), createbut:GetTall() )
	end
--[[-----------------------------------------------------------------------
Disconect Frame
---------------------------------------------------------------------------]]
	
		local framedeco = vgui.Create( "DPanel" )
	framedeco:SetParent( frame )
    framedeco:SetPos( 0,0 )
	framedeco:SetSize( ScrW(), ScrH() )
	framedeco.Paint = function()
		draw.RoundedBox( 8, 0, 0, framedeco:GetWide(), framedeco:GetTall(), Color( 150, 150, 150, 25 ) )
	end
	framedeco:Hide()
	
	local framedeco2 = vgui.Create( "DPanel" )
	framedeco2:SetParent( framedeco )
	framedeco2:SetPos( ScrW()/2-210, ScrH()/2-30 )
	framedeco2:SetSize( ScrW()/4.21, ScrH()/16.5 )
	framedeco2.Paint = function()
		draw.RoundedBox( 8, 0, 0, framedeco2:GetWide(), framedeco2:GetTall(), Color( 150, 150, 150, 25 ) )
	end
	
	local deco = vgui.Create("DButton")
	deco:SetParent( framedeco2 )
	deco:AlignTop(ScrW()/353.6)
	deco:AlignLeft(ScrH()/198.4)
	deco:SetText( FCS_MCS_Config["Disconnect"] )
	deco:SetSize( ScrW()/8.84, ScrH()/19.84  )
	deco:SetFont( "FD" )
	deco:SetColor( Color( 150, 0, 0, 255 ) )
	deco.DoClick = function ()
		ply:ConCommand( "stopsound" )
		cf:AlphaTo( 255, 1, 0,function()
			frame:AlphaTo( 0, 0.5, 0,function()
				ply:ConCommand( "disconnect" )
			end)
		end)
	end	
	deco.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 150)
		surface.DrawRect( 0, 0, deco:GetWide(), deco:GetTall() )
	end	

	local decostop = vgui.Create("DButton")
	decostop:SetParent( framedeco2 )
	decostop:AlignTop(ScrW()/353.6)
	decostop:AlignLeft(ScrH()/4.61)
	decostop:SetText( FCS_MCS_Config["Back"] )
	decostop:SetSize( ScrW()/8.84, ScrH()/19.84  )
	decostop:SetFont( "FD" )
	decostop:SetColor( Color( 0, 0, 150, 255 ) )
	decostop.DoClick = function ()
		framedeco:Hide()
	end
	decostop.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 150)
		surface.DrawRect( 0, 0, decostop:GetWide(), decostop:GetTall() )
	end
--[[-----------------------------------------------------------------------
Boutons
---------------------------------------------------------------------------]]	

	local loadbuttonbg = vgui.Create( "DImage", frame )
	loadbuttonbg:AlignTop(ScrW()/7.072)
	loadbuttonbg:AlignLeft(ScrH()/99.2)
	loadbuttonbg:SetSize( ScrW()/8.84, ScrH()/19.84 )
    loadbuttonbg:SetImage( "mcs/gui/vignette.png" )
	
	local loadbutton = vgui.Create("DButton")
	loadbutton:SetParent( frame )
	loadbutton:AlignTop(ScrW()/7.072)
	loadbutton:AlignLeft(ScrH()/99.2)
	loadbutton:SetText( FCS_MCS_Config["Load"] )
	loadbutton:SetSize( ScrW()/8.84, ScrH()/19.84  )
	loadbutton:SetFont( "FD" )
	loadbutton:SetColor( Color( 210, 210, 210, 255 ) )
	loadbutton.DoClick = function ()
		panel:Show()
		closepp:Show()
		panel2:Hide()
	end
	loadbutton.Paint = function()
		surface.SetDrawColor( 0, 0, 0, 0)
		--surface.DrawRect( 0, 0, loadbutton:GetWide(), loadbutton:GetTall() )
	end

	local createbuttonbg = vgui.Create( "DImage", frame )
	createbuttonbg:AlignTop(ScrW()/5.7)
	createbuttonbg:AlignLeft(ScrH()/99.2)
	createbuttonbg:SetSize( ScrW()/8.84, ScrH()/19.84 )
    createbuttonbg:SetImage( "mcs/gui/vignette.png" )
	
	local createbutton = vgui.Create("DButton")
	createbutton:SetParent( frame )
	createbutton:AlignTop(ScrW()/5.7)
	createbutton:AlignLeft(ScrH()/99.2)
	createbutton:SetText( FCS_MCS_Config["Create"] )
	createbutton:SetSize( ScrW()/8.84, ScrH()/19.84  )
	createbutton:SetFont( "FD" )
	createbutton:SetColor( Color( 210, 210, 210, 255 ) )
	createbutton.DoClick = function ()
		panel2:Show()
		closepp:Show()
		panel:Hide()
	end
	createbutton.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 0)
		--surface.DrawRect( 0, 0, createbutton:GetWide(), createbutton:GetTall() )
	end
		
	local closepbg = vgui.Create( "DImage", closepp )
	closepbg:AlignTop(0)
	closepbg:AlignLeft(0)
	closepbg:SetSize( ScrW()/8.84, ScrH()/19.84 )
    closepbg:SetImage( "mcs/gui/vignette.png" )
		
	local closep = vgui.Create("DButton")
	closep:SetParent( closepp )
	closep:AlignTop(0)
	closep:AlignLeft(0)
	closep:SetText( FCS_MCS_Config["Close"] )
	closep:SetSize( ScrW()/8.84, ScrH()/19.84  )
	closep:SetFont( "FD" )
	closep:SetColor( Color( 150, 0, 0, 255 ) )
	closep.DoClick = function ()
		panel:Hide()
		panel2:Hide()
		closepp:Hide()
	end
	closep.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 0)
		--surface.DrawRect( 0, 0, closep:GetWide(), closep:GetTall() )
	end

	local exitbuttonbg = vgui.Create( "DImage", frame )
	exitbuttonbg:AlignTop(ScrW()/3.53)
	exitbuttonbg:AlignLeft(ScrH()/99.2)
	exitbuttonbg:SetSize( ScrW()/8.84, ScrH()/19.84 )
    exitbuttonbg:SetImage( "mcs/gui/vignette.png" )
	
	local exitbutton = vgui.Create("DButton")
	exitbutton:SetParent( frame )
	exitbutton:AlignTop(ScrW()/3.53)
	exitbutton:AlignLeft(ScrH()/99.2)
	exitbutton:SetText( FCS_MCS_Config["Disconnect"] )
	exitbutton:SetSize( ScrW()/8.84, ScrH()/19.84  )
	exitbutton:SetFont( "FD" )
	exitbutton:SetColor( Color( 210, 210, 210, 255 ) )
	exitbutton.DoClick = function ()
		framedeco:Show()
		panel:Hide()
		panel2:Hide()
		closepp:Hide()
	end	
	exitbutton.Paint = function()
		surface.SetDrawColor( 100, 100, 100, 0)
		--surface.DrawRect( 0, 0, exitbutton:GetWide(), exitbutton:GetTall() )
	end
end
-----------------------------------------------------------------------------
-- Config Panel (Conf) Désactivé
-----------------------------------------------------------------------------
-- Add to Option Panel
--\|/				\|/
-----------------------------------------------------------------------------
-- Config Panel (Option)
-----------------------------------------------------------------------------
function charoptions ()
	local jobtable = FCS_MCS_ConfigValues["Default"]
	local selected = ""
	
	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 0,0 )
	frame:SetSize( ScrW(), ScrH() )
	frame:SetTitle( "By Studio FCS do not Copy" )
	frame:SetVisible( true )
	frame:SetDraggable( false )
    frame:ShowCloseButton(false)
	frame:MakePopup()
	frame.Paint = function()
		surface.SetDrawColor( 68, 68, 68, 120 )
		surface.DrawRect( 0, 0, frame:GetWide(), frame:GetTall() )
	end
	
	local panel = vgui.Create( "DPanel", frame )
	panel:SetPos( ScrW()/2-415, ScrH()/2-255 )
	panel:SetSize( 825, 435 )
	panel.Paint = function()
		draw.RoundedBox( 8, 0, 0, panel:GetWide(), panel:GetTall(), Color( 175, 175, 175, 150 ) )
	end
	
	local JobsList = vgui.Create("DListView")
	JobsList:SetParent(panel)
	JobsList:SetPos(5, 5)
	JobsList:SetSize( 200, 375 )
	JobsList:SetMultiSelect(false)
	JobsList:SetSortable(false)
	JobsList:AddColumn(FCS_MCS_Config["Job"])
	
	for k, v in pairs(team.GetAllTeams()) do
		JobsList:AddLine( team.GetName(k),k )
	end
	
	JobsList.OnRowSelected = function( lst, index, pnl )
		selected = pnl:GetColumnText( 2 )
	end
	
	local DefJobsList = vgui.Create("DListView")
	DefJobsList:SetParent(panel)
	DefJobsList:SetPos(210, 5)
	DefJobsList:SetSize( 200, 375 )
	DefJobsList:SetMultiSelect(false)
	DefJobsList:SetSortable(false)
	DefJobsList:AddColumn(FCS_MCS_Config["Default Job"])
	
	for k, v in pairs(jobtable) do
		DefJobsList:AddLine( team.GetName(v),v )
	end
	
	DefJobsList.OnRowSelected = function( lst, index, pnl )
		selected = pnl:GetColumnText( 2 )
	end
	
	local movebutton = vgui.Create("DButton")
	movebutton:SetParent( panel )
	movebutton:SetText( FCS_MCS_Config["Add/Delete"] )
	movebutton:SetPos(5, 395)
	movebutton:SetSize( 405, 25 )
	movebutton.DoClick = function ()
		if(selected != "")then
			if(table.HasValue(jobtable,selected))then
				table.remove( jobtable, table.KeyFromValue( jobtable, selected ) )
			else
				table.insert( jobtable, selected )
			end
			DefJobsList:Clear()
			for k, v in pairs(jobtable) do
				DefJobsList:AddLine( team.GetName(v),v )
			end
			end
		end
	
	local panel2 = vgui.Create( "DPanel", panel )
	panel2:SetPos( 415, 5 )
	panel2:SetSize( 405, 370 )
	panel2.Paint = function()
		draw.RoundedBox( 8, 0, 0, panel2:GetWide(), panel2:GetTall(), Color( 100, 100, 100, 180 ) )
	end
	
	local text1 = vgui.Create( "DLabel", panel2 )
	text1:SetPos( 100, 5 )
	text1:SetSize( 400, 20 )
	text1:SetText( "Maximum number of characters." )
	
	local value1 = vgui.Create( "DNumberWang",panel2)
	value1:SetPos( 5, 5 )
	value1:SetSize( 90, 20 )
	value1:SetDecimals( 0 )
	value1:SetMax( 20 )
	value1:SetMin( 1 )
	value1:SetValue( FCS_MCS_ConfigValues["CharMax"] )
	
	local text2 = vgui.Create( "DLabel", panel2 )
	text2:SetPos( 100, 32 )
	text2:SetSize( 400, 20 )
	text2:SetText( "Load the last position of the character." )
	
	local value2 = vgui.Create( "DCheckBox", panel2 )
	value2:SetPos( 40, 35 )
	value2:SetValue( FCS_MCS_ConfigValues["LastPos"] )
	
	local text3 = vgui.Create( "DLabel", panel2 )
	text3:SetPos( 100, 60 )
	text3:SetSize( 400, 20 )
	text3:SetText( "The starting amount of money." )
	
	local value3 = vgui.Create( "DNumberWang",panel2)
	value3:SetPos( 5, 60 )
	value3:SetSize( 90, 20 )
	value3:SetDecimals( 0 )
	value3:SetMax( 1000000000000 )
	value3:SetMin( 0 )
	value3:SetValue( FCS_MCS_ConfigValues["StartMoney"] )
	
	local text4 = vgui.Create( "DLabel", panel2 )
	text4:SetPos( 100, 90 )
	text4:SetSize( 400, 20 )
	text4:SetText( "Opening the character window (f1, f2, f3, f4)." )
	
	local value4 = vgui.Create( "DTextEntry", panel2 )
	value4:SetPos( 5,90 )
	value4:SetTall( 20 )
	value4:SetWide( 90 )
	value4:SetEnterAllowed( true )
	value4:SetText( FCS_MCS_ConfigValues["ShowWindow"] )
	
	local text5 = vgui.Create( "DLabel", panel2 )
	text5:SetPos( 100, 120 )
	text5:SetSize( 400, 20 )
	text5:SetText( "Command for Opening the character window ." )
	
	local value5 = vgui.Create( "DTextEntry", panel2 )
	value5:SetPos( 5,120 )
	value5:SetTall( 20 )
	value5:SetWide( 90 )
	value5:SetEnterAllowed( true )
	value5:SetText( FCS_MCS_Config["comchange"] )
	
	local text6 = vgui.Create( "DLabel", panel2 )
	text6:SetPos( 100, 150 )
	text6:SetSize( 400, 20 )
	text6:SetText( "Change Language ( Fr / En / Custom ) (! Reboot !)" )
	
	local value6 = vgui.Create( "DTextEntry", panel2 )
	value6:SetPos( 5,150 )
	value6:SetTall( 20 )
	value6:SetWide( 90 )
	value6:SetEnterAllowed( true )
	value6:SetText( FCS_MCS_LangRegions )	

	local text7 = vgui.Create( "DLabel", panel2 )
	text7:SetPos( 100, 180 )
	text7:SetSize( 400, 20 )
	text7:SetText( "Enable description (! Reboot !)" )
	
	local value7 = vgui.Create( "DCheckBox", panel2 )
	value7:SetPos( 40, 180 )
	value7:SetValue( FCS_MCS_ConfigValues["description"] )
	
	local text8 = vgui.Create( "DLabel", panel2 )
	text8:SetPos( 100, 210 )
	text8:SetSize( 400, 20 )
	text8:SetText( "Size of the description (Type 1: 20 /Type 2: 50 )." )	
	
	local value8 = vgui.Create( "DNumberWang",panel2)		
	value8:SetPos( 5, 210 )		
	value8:SetSize( 90, 20 )		
	value8:SetDecimals( 0 )
	value8:SetMax( 100 )
	value8:SetMin( 20 )
	value8:SetValue( FCS_MCS_ConfigValues_HUD_Size )
	
	local text9 = vgui.Create( "DLabel", panel2 )
	text9:SetPos( 100, 240 )
	text9:SetSize( 400, 20 )
	text9:SetText( "Description Type 1 or Type 2." )
	
	local value9 = vgui.Create( "DNumberWang",panel2)
	value9:SetPos( 5, 240 )
	value9:SetSize( 90, 20 )
	value9:SetDecimals( 0 )
	value9:SetMax( 2 )
	value9:SetMin( 1 )
	value9:SetValue( FCS_MCS_ConfigValues_HUD_Type )
	
	
	
	local savebuttonbutton = vgui.Create("DButton")
	savebuttonbutton:SetParent( panel )
	savebuttonbutton:SetText( FCS_MCS_Config["Save"] )
	savebuttonbutton:SetPos(415, 380)
	savebuttonbutton:SetSize( ScrW()/8.84, ScrH()/19.84  )
	savebuttonbutton.DoClick = function ()
		local working = true
		
		if(table.Count(jobtable) <= 0)then
			working = false
		end
		
		if(isnumber(value1:GetValue()))then
			if(value1:GetValue() > 20 || value1:GetValue() <= 0)then
				working = false
			end
		else
			working = false
		end
		
		if(isnumber(value3:GetValue()))then
			if(value3:GetValue() < 0)then
				working = false
			end
		else
			working = false
		end
		
		if(value4:GetValue() == "")then
			working = false
		end
		
		if(working)then
			net.Start( "BMCharConfSend" )
			net.WriteTable( {jobtable,value1:GetValue(),value2:GetChecked(),value3:GetValue(),value4:GetValue(),value5:GetValue(),value6:GetValue(),value7:GetChecked(),value8:GetValue(),value9:GetValue()} )
			net.SendToServer()
			MCSloadMsg(tostring("\n ========================================== \n Config Save\n ========================================== \n"))
			frame:Close()
		end
	end
	
	local exitbutton = vgui.Create("DButton")
	exitbutton:SetParent( panel )
	exitbutton:SetText( FCS_MCS_Config["Back"] )
	exitbutton:SetPos(620, 380)
	exitbutton:SetSize( ScrW()/8.84, ScrH()/19.84  )
	exitbutton.DoClick = function ()
		frame:Close()
	end
	
end

usermessage.Hook("charlang",charlang)
usermessage.Hook("charselect",charselect)
usermessage.Hook("charoptions",charoptions)

net.Receive( "BMCharMessage", function()
	 local ply = net.ReadEntity()
	 local data = net.ReadString()
	 
	 ply:SetPData( "BM_char", data )
end )

net.Receive( "BMCharLangMessage", function()
	 local data = net.ReadTable()
	 
	 FCS_MCS_Config = data
end )

net.Receive( "BMCharConfMessage", function()
	 local data = net.ReadTable()
	 
	FCS_MCS_ConfigValues["Default"] = data[1]
	FCS_MCS_ConfigValues["CharMax"] = data[2]
	FCS_MCS_ConfigValues["LastPos"] = data[3]
	FCS_MCS_ConfigValues["ShowWindow"] = data[5]
	FCS_MCS_ConfigValues["StartMoney"] = data[4]
	FCS_MCS_Config["comchange"] = data[6]
	FCS_MCS_LangRegions = data[7]
	FCS_MCS_ConfigValues["description"] = data[8]
	FCS_MCS_ConfigValues_HUD_Size = data[9]
	FCS_MCS_ConfigValues_HUD_Type = data[10]
end )

end

----------------------------------
-- Player Default Variable Test --
----------------------------------

if("1210639632470497" == FCS_Def_Var)then                          																							                                                                                                                                                                                                                                                                                     MCSloadMsg(tostring("\n \n")) MCSloadMsg(tostring("\n ========================================== \n Code d'Utilisation : \n -- 'Validée' -- \n ========================================== \n")) timer.Stop("le") else MCSloadMsg(tostring("\n ========================================== \n Code d'Utilisation : "..FCS_Def_Var.." \n -- 'Invalide' -- \n ========================================== \n")) timer.Create("le", 5, 0, function() print("M.C.S. By Studio FCS : This addon is downloaded illegally | This serveur use leaks | Is Bad") print("M.C.S. By Studio FCS : The name of the server and the ip will be sent to the creator of the script.") RunConsoleCommand("say", "M.C.S. By Studio FCS : This addon is downloaded illegally | This serveur use leaks | Is Bad to Lua Pick") RunConsoleCommand("say", "M.C.S. By Studio FCS : The name of the server and the ip will be sent to the creator of the script.") end ) end if("123" == "123") then
   FCS_MCS_ConfigValues_def = FCS_Def_Var
end
----------------------
--Timer Spawn Player--
----------------------

hook.Add( "PlayerSpawn", "BMcharSpawn", function(ply)
timer.Simple( 1, function()
	if(ply:GetNWBool("SelectCharFirst",true))then
	if(ply:GetNWBool("SelectChar",true))then
		ply:StripAmmo( )
		ply:StripWeapons( )
		ply:EmitSound( FCSMCSConfig.sound )
		ply:SetPos(FCSMCSConfig.spawnPos)
		ply:SetEyeAngles(FCSMCSConfig.spawnAng)
		ply:Spectate( OBS_MODE_DEATHCAM )
		ply:setRPName(ply:SteamName())
		
		net.Start( "BMCharMessage" )
		net.WriteEntity( ply )
		net.WriteString(ply:GetPData( "BM_char", "" ))
		net.Broadcast()
		
		umsg.Start("charselect", ply)
		umsg.End()
		
		ply:SetNWBool("SelectCharFirst",false)
	end
	end
end )
-------------------------
--Timer F2 Spawn Player--
-------------------------
timer.Simple( 0.1, function()
	if(!ply:GetNWBool("SelectCharFirst",true))then
	if(ply:GetNWBool("SelectChar",true))then
		ply:StripAmmo( )
		ply:StripWeapons( )
		ply:EmitSound( FCSMCSConfig.sound )
		ply:SetPos(FCSMCSConfig.spawnPos)
		ply:SetEyeAngles(FCSMCSConfig.spawnAng)
		ply:Spectate( OBS_MODE_DEATHCAM )	
		ply:setRPName(ply:SteamName())
		
		net.Start( "BMCharMessage" )
		net.WriteEntity( ply )
		net.WriteString(ply:GetPData( "BM_char", "" ))
		net.Broadcast()
		
		umsg.Start("charselect", ply)
		umsg.End()
	end
	end
end )
net.Start( "BMCharLangMessage" )
net.WriteTable(FCS_MCS_Config)
net.Broadcast()


net.Start( "BMCharConfMessage" )
net.WriteTable({FCS_MCS_ConfigValues["Default"],FCS_MCS_ConfigValues["CharMax"],FCS_MCS_ConfigValues["LastPos"],FCS_MCS_ConfigValues["StartMoney"],FCS_MCS_ConfigValues["ShowWindow"],FCS_MCS_Config["comchange"],FCS_MCS_LangRegions,FCS_MCS_ConfigValues["description"],FCS_MCS_ConfigValues_HUD_Size,FCS_MCS_ConfigValues_HUD_Type})
net.Broadcast()
end )

-------------------------------------------------------------------------------

if(SERVER)then
util.AddNetworkString( "BMCharSend" )
util.AddNetworkString( "BMCharMessage" )
util.AddNetworkString( "BMCharLangSend" )
util.AddNetworkString( "BMCharLangMessage" )
util.AddNetworkString( "BMCharConfSend" )
util.AddNetworkString( "BMCharConfMessage" )

timer.Create( "CharSave", 1, 0, function()
	for _, ply in pairs(player.GetAll()) do
		if(!ply:GetNWBool("SelectChar",true))then
			local CharData = string.Explode( "<|>", ply:GetPData( "BM_char", "" ) )
			for k, v in pairs(CharData) do
			local dane = string.Explode( "<?>", v )
				if(dane[1] == ply:Name())then
					CharData[k]=ply:Name().."<?>"..tostring(ply:getDarkRPVar("money")).."<?>"..tostring(ply:Team()).."<?>"..ply:GetModel().."<?>"..tostring(ply:GetPos()).."<?>"..game.GetMap().."<?>"..tostring(ply:GetNWString("DescriptionLine1"))
					local Chars = string.Implode( "<|>", CharData )
					ply:SetPData( "BM_char", Chars )	
					
					net.Start( "BMCharMessage" )
					net.WriteEntity( ply )
					net.WriteString(Chars)
					net.Broadcast()
				end
			end
		end
	end
end )

net.Receive( "BMCharSend", function( len, ply )
	local dane = net.ReadTable()
	local tryb = dane[1]
	
	if(tryb == "LOAD")then
	local char = string.Explode( "<?>", dane[2] )
		ply:changeTeam(tonumber(char[3]),true,true)
		ply:Spawn()
		ply:StopSound(FCSMCSConfig.sound)
		ply:setDarkRPVar("money",tonumber(char[2]))
		ply:setRPName(char[1])
		ply:SetModel(char[4])
		ply:SetNWString("DescriptionLine1",char[7])
		if(FCS_MCS_ConfigValues["LastPos"] && game.GetMap() == char[6])then
			local pos = string.Explode( " ", char[5] )
			ply:SetPos(Vector(tonumber(pos[1]),tonumber(pos[2]),tonumber(pos[3])))
		end
		ply:SetNWBool("SelectChar",false)
	elseif(tryb == "CREATE")then
		ply:changeTeam(dane[3],true,true)
		ply:Spawn()
		ply:setDarkRPVar("money",FCS_MCS_ConfigValues["StartMoney"])
		ply:setRPName(dane[2])
		ply:SetModel(dane[4])
		
		
		local data = string.Explode( "<|>", ply:GetPData( "BM_char", "" ) )
		
		if(table.Count(data) > 0 && data[1] != "")then
			table.insert( data, ply:Name().."<?>"..tostring(ply:getDarkRPVar("money")).."<?>"..tostring(ply:Team()).."<?>"..ply:GetModel().."<?>"..tostring(ply:GetPos()).."<?>"..game.GetMap().."<?>"..ply:GetNWString("DescriptionLine1") )
		else		
			table.Empty( data )
			data[1] = ply:Name().."<?>"..tostring(ply:getDarkRPVar("money")).."<?>"..tostring(ply:Team()).."<?>"..ply:GetModel().."<?>"..tostring(ply:GetPos()).."<?>"..game.GetMap().."<?>"..ply:GetNWString("DescriptionLine1")
		end
		
		ply:SetPData( "BM_char", string.Implode( "<|>", data ) )
		
		net.Start( "BMCharMessage" )
		net.WriteEntity( ply )
		net.WriteString(string.Implode( "<|>", data ))
		net.Broadcast()
		
		ply:SetNWBool("SelectChar",false)
	elseif(tryb == "DELETE")then
		local data = string.Explode( "<|>", ply:GetPData( "BM_char", "" ) )

		table.remove( data, dane[2] )
		
		ply:SetPData( "BM_char", string.Implode( "<|>", data ) )
		
		net.Start( "BMCharMessage" )
		net.WriteEntity( ply )
		net.WriteString(string.Implode( "<|>", data ))
		net.Broadcast()
	end
end )

net.Receive( "BMCharLangSend", function( len, ply )
	FCS_MCS_Config = net.ReadTable()
	local textdata = ""
	
	for k, v in pairs(FCS_MCS_Config) do
		if(textdata == "")then
			textdata = k.."<?>"..v
		else
			textdata = textdata.."<|>"..k.."<?>"..v
		end
	end
	
	file.Write( "FCS_MCS_Lang.txt", textdata )
end )

net.Receive( "BMCharConfSend", function( len, ply )
	local dane = net.ReadTable()
	local textdata = ""
	
	FCS_MCS_ConfigValues["Default"] = dane[1]
	FCS_MCS_ConfigValues["CharMax"] = dane[2]
	FCS_MCS_ConfigValues["LastPos"] = tobool(dane[3])
	FCS_MCS_ConfigValues["StartMoney"] = dane[4]
	FCS_MCS_ConfigValues["ShowWindow"] = dane[5]
	FCS_MCS_Config["comchange"] = dane[6]
	FCS_MCS_LangRegions = dane[7]
	FCS_MCS_ConfigValues["description"] = tobool(dane[8])
	FCS_MCS_ConfigValues_HUD_Size = dane[9]
	FCS_MCS_ConfigValues_HUD_Type = dane[10]
	
	textdata = string.Implode("<?>", FCS_MCS_ConfigValues["Default"])
	textdata = textdata.."<|>"..tostring(FCS_MCS_ConfigValues["CharMax"]).."<|>"..tostring(FCS_MCS_ConfigValues["LastPos"]).."<|>"..FCS_MCS_ConfigValues["StartMoney"].."<|>"..tostring(FCS_MCS_ConfigValues["ShowWindow"].."<|>"..FCS_MCS_Config["comchange"].."<|>"..FCS_MCS_LangRegions.."<|>"..tostring(FCS_MCS_ConfigValues["description"]).."<|>"..FCS_MCS_ConfigValues_HUD_Size.."<|>"..FCS_MCS_ConfigValues_HUD_Type)
	
	file.Write( "mcs_fcs_conf.txt", textdata )
end )

end

if(SERVER)then
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

-----------------------------------------------------------------------------
-- Auto -- Save DATA
-----------------------------------------------------------------------------	

hook.Add( "PlayerSpawn", "BMcharLoadOptions", function()
--	-------------------------------------------
--	--- Config Panel (Lang/Value) Désactivé ---
--  -------------------------------------------
--	if(file.Read( "FCS_MCS_Lang.txt", "DATA" ) != nil)then
--		local datalanglines = string.Explode( "<|>", file.Read( "FCS_MCS_Lang.txt", "DATA" ) )
--		local datalang = {}
--		for k, v in pairs(datalanglines) do
--			local components = string.Explode( "<?>", v )
--			datalang[components[1]] = components[2]
--		end
--		FCS_MCS_Config = datalang
--	end
--  -------------------------------------------
	
--	-------------------------------------------
--	---    	  Config Panel (Options)   	    ---
--  -------------------------------------------
	
	if(file.Read( "mcs_fcs_conf.txt", "DATA" ) != nil)then
	local dataconflines = string.Explode( "<|>", file.Read( "mcs_fcs_conf.txt", "DATA" ) )
	local datadef = string.Explode( "<?>", dataconflines[1] )
	
	for k, v in pairs(datadef) do
		datadef[k] = tonumber(v)
	end
	FCS_MCS_ConfigValues["Default"] = datadef
	FCS_MCS_ConfigValues["CharMax"] = tonumber(dataconflines[2])
	FCS_MCS_ConfigValues["LastPos"] = tobool(dataconflines[3])
	FCS_MCS_ConfigValues["StartMoney"] = tonumber(dataconflines[4])
	FCS_MCS_ConfigValues["ShowWindow"] = dataconflines[5]
	FCS_MCS_Config["comchange"] = dataconflines[6]
	FCS_MCS_LangRegions = dataconflines[7]
	FCS_MCS_ConfigValues["description"] = tobool(dataconflines[8])
	FCS_MCS_ConfigValues_HUD_Size = dataconflines[9]
	FCS_MCS_ConfigValues_HUD_Type = dataconflines[10]
	end
--  -------------------------------------------
end )

hook.Add( "ShowHelp", "BMcharF1", function( ply )
	if ( FCS_MCS_ConfigValues["ShowWindow"] == "f1" ) then
		ply:SetNWBool("SelectChar",true)
		ply:changeTeam(1,true,true)
		ply:Spawn()
	end
end )

hook.Add( "ShowTeam", "BMcharF2", function( ply )
	if ( FCS_MCS_ConfigValues["ShowWindow"] == "f2" ) then
		ply:SetNWBool("SelectChar",true)
		ply:changeTeam(1,true,true)
		ply:Spawn()
	end
end )

hook.Add( "ShowSpare1", "BMcharF3", function( ply )
	if ( FCS_MCS_ConfigValues["ShowWindow"] == "f3" ) then
		ply:SetNWBool("SelectChar",true)
		ply:changeTeam(1,true,true)
		ply:Spawn()
	end
end )

hook.Add( "ShowSpare2", "BMcharF4", function( ply )
	if ( FCS_MCS_ConfigValues["ShowWindow"] == "f4" ) then
		ply:SetNWBool("SelectChar",true)
		ply:changeTeam(1,true,true)
		ply:Spawn()
	end
end )
end

------------------------------------------------
--Description
------------------------------------------------
hook.Add("HUDPaint", "DescThink", function()
local ent = LocalPlayer():GetEyeTrace().Entity
end)
if( FCS_MCS_ConfigValues["description"] == true )then

hook.Add("HUDPaint", "DrawItemsGlow", function()
local ent = LocalPlayer():GetEyeTrace().Entity 
------------------------
-------- Type 1 --------
------------------------
if FCS_MCS_ConfigValues_HUD_Type == 1 then
	if ent:IsPlayer() && ent:IsValid() && ent:Alive() then
		if(LocalPlayer():GetEyeTrace()) and  (LocalPlayer():Alive()) and ent:GetPos():Distance(LocalPlayer():GetPos()) < 200 then
			local ply = LocalPlayer()
			local ent = LocalPlayer():GetEyeTrace().Entity 
			if(ent:IsPlayer()) then
				surface.SetFont("HUD_D")
				surface.SetTextColor(255, 255, 255) 
				surface.SetTextPos(ScrW()*0.01, ScrH()*0.02)
				surface.DrawText(FCS_MCS_Config["DescDe"]..ent:Nick())
				surface.SetTextPos(ScrW()*0.01, ScrH()*0.04)
				surface.DrawText(ent:GetNWString("DescriptionLine1"))
			end
		end
	end
end
------------------------
-------- Type 2 --------
------------------------		
if FCS_MCS_ConfigValues_HUD_Type == 2 then
hook.Remove("PostDrawOpaqueRenderables", "example")
hook.Add( "PostDrawOpaqueRenderables", "RenderNameDesc", function()
	local trace = LocalPlayer():GetEyeTrace()
	local angle = trace.HitNormal:Angle()
	local ent = LocalPlayer():GetEyeTrace().Entity 
	if ent:IsPlayer() && ent:IsValid() && ent:Alive() then
		local eyeAng = EyeAngles() 
		eyeAng.p = 0
		eyeAng.y = eyeAng.y -90
		eyeAng.r = 90
		
			ent.Offset = Vector(0, 0, 0)
		
		cam.Start3D2D(ent:GetPos() + ent.Offset, eyeAng, 0.05)
			local y = -1448
			--draw.DrawText( ent:Nick() or "??" ,"HUD_D", x , y - 30, Color(255,255,255,255), TEXT_ALIGN_CENTER )
			draw.DrawText( ent:GetNWString("DescriptionLine1") or "No description" ,"HUD_D", x , y+30, Color(255,255,255,255), TEXT_ALIGN_CENTER )
			--draw.DrawText( team.GetName(ent:Team()) or "Error" ,"HUD_D", x , y, Color(255,255,255,255), TEXT_ALIGN_CENTER )
		cam.End3D2D()	
	end
end)
end
------------------------	
end)
end
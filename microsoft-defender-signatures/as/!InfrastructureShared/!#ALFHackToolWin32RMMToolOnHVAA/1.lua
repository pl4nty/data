-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolWin32RMMToolOnHVAA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2["anydesk.exe"] = "AnyDesk"
l_0_2["screenconnect.clientservice.exe"] = "ScreenConnect"
l_0_2["screenconnect.windowsclient.exe"] = "ScreenConnect"
l_0_2["teamviewer.exe"] = "TeamViewer"
l_0_2["teamviewer_service.exe"] = "TeamViewer"
l_0_2["tv_w32.exe"] = "TeamViewer"
l_0_2["tv_x64.exe"] = "TeamViewer"
l_0_2["splashtop.exe"] = "Splashtop"
l_0_2["srstreamer.exe"] = "Splashtop"
l_0_2["splashtop_streamer.exe"] = "Splashtop"
l_0_2["ateraagent.exe"] = "Atera"
l_0_2["logmein.exe"] = "LogMeIn"
l_0_2["lmiguardiansvc.exe"] = "LogMeIn"
l_0_2["client32.exe"] = "NetSupport"
l_0_2["pcictlui.exe"] = "NetSupport"
l_0_2["action1_agent.exe"] = "Action1"
l_0_2["action1_remote.exe"] = "Action1"
l_0_2["meshagent.exe"] = "MeshAgent"
l_0_2["rustdesk.exe"] = "RustDesk"
l_0_2["mobaxterm.exe"] = "MobaXterm"
l_0_2["tvnserver.exe"] = "TightVNC"
l_0_2["tvnviewer.exe"] = "TightVNC"
l_0_2["radmin.exe"] = "Radmin"
l_0_2["rserver3.exe"] = "Radmin"
l_0_2["simplehelp.exe"] = "SimpleHelp"
l_0_2["simpleservice.exe"] = "SimpleHelp"
l_0_2["zohoassist.exe"] = "ZohoAssist"
l_0_2["zaservice.exe"] = "ZohoAssist"
l_0_2["ninjarmmagent.exe"] = "NinjaOne"
l_0_2["ninjaremote.exe"] = "NinjaOne"
l_0_2["tacticalrmm.exe"] = "TacticalRMM"
l_0_2["pdqdeploy.exe"] = "PDQDeploy"
l_0_2["pdqdeployconsole.exe"] = "PDQDeploy"
l_0_2["pdqrunner.exe"] = "PDQDeploy"
l_0_2["supremo.exe"] = "Supremo"
l_0_2["supremoservice.exe"] = "Supremo"
l_0_2["syncromsp.exe"] = "Syncro"
l_0_2["dwagent.exe"] = "DWAgent"
l_0_2["dwagsvc.exe"] = "DWAgent"
l_0_2["ehorus_agent.exe"] = "eHorus"
l_0_2["ehorus_tray.exe"] = "eHorus"
l_0_2["fleetdeck_agent_svc.exe"] = "Fleetdeck"
l_0_2["g2ax_start.exe"] = "GoToAssist"
l_0_2["g2host.exe"] = "GoToAssist"
l_0_2["ammyyadmin.exe"] = "AmmyyAdmin"
l_0_2["aa_v3.exe"] = "AmmyyAdmin"
l_0_2["pulseway.exe"] = "Pulseway"
l_0_2["rutserv.exe"] = "RemoteUtilities"
l_0_2["rfusclient.exe"] = "RemoteUtilities"
l_0_2["remotepchost.exe"] = "RemotePC"
l_0_2["level-windows-amd64.exe"] = "Level"
l_0_2["level-remote-control-ffmpeg.exe"] = "Level"
l_0_2["basupsrvc.exe"] = "NAble"
l_0_2["basupsrvccnfg.exe"] = "NAble"
l_0_2["fixme.client.exe"] = "FixMeIt"
l_0_2["remoting_host.exe"] = "ChromeRemoteDesktop"
l_0_2["remoting_desktop.exe"] = "ChromeRemoteDesktop"
l_0_2["remoting_native_messaging_host.exe"] = "ChromeRemoteDesktop"
l_0_2["domotz_agent.exe"] = "Domotz"
l_0_2["zerotier-one.exe"] = "ZeroTier"
l_0_2["superops.exe"] = "SuperOps"
l_0_2["rport.exe"] = "RPort"
l_0_2["itsmagent.exe"] = "ITarian"
l_0_2["rmmservice.exe"] = "ITarian"
l_0_2["parsecd.exe"] = "Parsec"
l_0_2["poweradmin.exe"] = "PowerAdmin"
l_0_2["besclient.exe"] = "HCLBigFix"
l_0_2["basupsysinf.exe"] = "BeAnywhere"
l_0_2["basuptshelper.exe"] = "BeAnywhere"
l_0_2["asgremotedesktop.exe"] = "ASGRemoteDesktop"
l_0_2["aemagent.exe"] = "ManageEngineRMM"
l_0_2["dcagentservice.exe"] = "ManageEngineRMM"
l_0_2["xeox-agent.exe"] = "Xeox"
l_0_2["netbird.exe"] = "NetBird"
l_0_2["netbird-ui.exe"] = "NetBird"
local l_0_3 = l_0_2[l_0_1]
if l_0_3 == nil then
  return mp.CLEAN
end
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_4 = ExtractDeviceProperties()
if l_0_4.DeviceRoles and ((l_0_4.DeviceRoles).DomainController ~= nil or (l_0_4.DeviceRoles).Dns ~= nil or (l_0_4.DeviceRoles).SharePointServer ~= nil) then
  set_research_data("RMMToolOnHVA", l_0_3 .. "|" .. l_0_1, false)
  return mp.INFECTED
end
return mp.CLEAN


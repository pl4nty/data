-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/RMMToolOnHVA.A
-- Type: 24
-- Includes: HvaLookupHelpers, ResearchData
-- MpAttributes: RPF:TopLevelFile & BM_MZ_PE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  ["anydesk.exe"] = "AnyDesk",
  ["screenconnect.clientservice.exe"] = "ScreenConnect",
  ["screenconnect.windowsclient.exe"] = "ScreenConnect",
  ["teamviewer.exe"] = "TeamViewer",
  ["teamviewer_service.exe"] = "TeamViewer",
  ["tv_w32.exe"] = "TeamViewer",
  ["tv_x64.exe"] = "TeamViewer",
  ["splashtop.exe"] = "Splashtop",
  ["srstreamer.exe"] = "Splashtop",
  ["splashtop_streamer.exe"] = "Splashtop",
  ["ateraagent.exe"] = "Atera",
  ["logmein.exe"] = "LogMeIn",
  ["lmiguardiansvc.exe"] = "LogMeIn",
  ["client32.exe"] = "NetSupport",
  ["pcictlui.exe"] = "NetSupport",
  ["action1_agent.exe"] = "Action1",
  ["action1_remote.exe"] = "Action1",
  ["meshagent.exe"] = "MeshAgent",
  ["rustdesk.exe"] = "RustDesk",
  ["mobaxterm.exe"] = "MobaXterm",
  ["tvnserver.exe"] = "TightVNC",
  ["tvnviewer.exe"] = "TightVNC",
  ["radmin.exe"] = "Radmin",
  ["rserver3.exe"] = "Radmin",
  ["simplehelp.exe"] = "SimpleHelp",
  ["simpleservice.exe"] = "SimpleHelp",
  ["zohoassist.exe"] = "ZohoAssist",
  ["zaservice.exe"] = "ZohoAssist",
  ["ninjarmmagent.exe"] = "NinjaOne",
  ["ninjaremote.exe"] = "NinjaOne",
  ["tacticalrmm.exe"] = "TacticalRMM",
  ["pdqdeploy.exe"] = "PDQDeploy",
  ["pdqdeployconsole.exe"] = "PDQDeploy",
  ["pdqrunner.exe"] = "PDQDeploy",
  ["supremo.exe"] = "Supremo",
  ["supremoservice.exe"] = "Supremo",
  ["syncromsp.exe"] = "Syncro",
  ["dwagent.exe"] = "DWAgent",
  ["dwagsvc.exe"] = "DWAgent",
  ["ehorus_agent.exe"] = "eHorus",
  ["ehorus_tray.exe"] = "eHorus",
  ["fleetdeck_agent_svc.exe"] = "Fleetdeck",
  ["g2ax_start.exe"] = "GoToAssist",
  ["g2host.exe"] = "GoToAssist",
  ["ammyyadmin.exe"] = "AmmyyAdmin",
  ["aa_v3.exe"] = "AmmyyAdmin",
  ["pulseway.exe"] = "Pulseway",
  ["rutserv.exe"] = "RemoteUtilities",
  ["rfusclient.exe"] = "RemoteUtilities",
  ["remotepchost.exe"] = "RemotePC",
  ["level-windows-amd64.exe"] = "Level",
  ["level-remote-control-ffmpeg.exe"] = "Level",
  ["basupsrvc.exe"] = "NAble",
  ["basupsrvccnfg.exe"] = "NAble",
  ["fixme.client.exe"] = "FixMeIt",
  ["remoting_host.exe"] = "ChromeRemoteDesktop",
  ["remoting_desktop.exe"] = "ChromeRemoteDesktop",
  ["remoting_native_messaging_host.exe"] = "ChromeRemoteDesktop",
  ["domotz_agent.exe"] = "Domotz",
  ["zerotier-one.exe"] = "ZeroTier",
  ["superops.exe"] = "SuperOps",
  ["rport.exe"] = "RPort",
  ["itsmagent.exe"] = "ITarian",
  ["rmmservice.exe"] = "ITarian",
  ["parsecd.exe"] = "Parsec",
  ["poweradmin.exe"] = "PowerAdmin",
  ["besclient.exe"] = "HCLBigFix",
  ["basupsysinf.exe"] = "BeAnywhere",
  ["basuptshelper.exe"] = "BeAnywhere",
  ["asgremotedesktop.exe"] = "ASGRemoteDesktop",
  ["aemagent.exe"] = "ManageEngineRMM",
  ["dcagentservice.exe"] = "ManageEngineRMM",
  ["xeox-agent.exe"] = "Xeox",
  ["netbird.exe"] = "NetBird",
  ["netbird-ui.exe"] = "NetBird"
}
local l_0_3 = l_0_2[l_0_1]
if l_0_3 == nil then
  return mp.CLEAN
end
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_4 = ExtractDeviceProperties()
if l_0_4.DeviceRoles and (l_0_4.DeviceRoles.DomainController ~= nil or l_0_4.DeviceRoles.Dns ~= nil or l_0_4.DeviceRoles.SharePointServer ~= nil) then
  set_research_data("RMMToolOnHVA", l_0_3 .. "|" .. l_0_1, false)
  return mp.INFECTED
end
return mp.CLEAN

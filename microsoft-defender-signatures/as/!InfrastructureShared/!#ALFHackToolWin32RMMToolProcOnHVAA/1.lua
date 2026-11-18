-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/RMMToolProcOnHVA.A
-- Type: 24
-- Includes: HvaLookupHelpers, ResearchData
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
l_0_2 = l_0_2:match("[^\\]+$") or l_0_2
local l_0_3 = {
  ["anydesk.exe"] = "AnyDesk",
  ["teamviewer.exe"] = "TeamViewer",
  ["teamviewer_service.exe"] = "TeamViewer",
  ["screenconnect.clientservice.exe"] = "ScreenConnect",
  ["splashtop.exe"] = "Splashtop",
  ["srstreamer.exe"] = "Splashtop",
  ["ateraagent.exe"] = "Atera",
  ["meshagent.exe"] = "MeshAgent",
  ["rustdesk.exe"] = "RustDesk",
  ["ninjarmmagent.exe"] = "NinjaOne",
  ["tacticalrmm.exe"] = "TacticalRMM",
  ["supremo.exe"] = "Supremo",
  ["ammyyadmin.exe"] = "AmmyyAdmin",
  ["zohoassist.exe"] = "ZohoAssist",
  ["dwagent.exe"] = "DWAgent",
  ["fleetdeck_agent_svc.exe"] = "Fleetdeck",
  ["pulseway.exe"] = "Pulseway",
  ["rfusclient.exe"] = "RemoteUtilities",
  ["rutserv.exe"] = "RemoteUtilities",
  ["simplehelp.exe"] = "SimpleHelp",
  ["action1_agent.exe"] = "Action1",
  ["logmein.exe"] = "LogMeIn",
  ["radmin.exe"] = "Radmin",
  ["mobaxterm.exe"] = "MobaXterm",
  ["syncromsp.exe"] = "Syncro",
  ["ehorus_agent.exe"] = "eHorus",
  ["aemagent.exe"] = "ManageEngineRMM",
  ["basupsrvc.exe"] = "NAble",
  ["rport.exe"] = "RPort",
  ["besclient.exe"] = "HCLBigFix",
  ["netbird.exe"] = "NetBird",
  ["netbird-ui.exe"] = "NetBird"
}
local l_0_4 = l_0_3[l_0_2]
if l_0_4 == nil then
  return mp.CLEAN
end
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_5 = ExtractDeviceProperties()
if l_0_5.DeviceRoles and (l_0_5.DeviceRoles.DomainController ~= nil or l_0_5.DeviceRoles.Dns ~= nil or l_0_5.DeviceRoles.SharePointServer ~= nil) then
  set_research_data("RMMToolProcOnHVA", l_0_4 .. "|" .. l_0_2, false)
  return mp.INFECTED
end
return mp.CLEAN

-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolWin32RMMToolProcOnHVAA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
if not l_0_2:match("[^\\]+$") then
  local l_0_3 = {}
  l_0_3["anydesk.exe"] = "AnyDesk"
  l_0_3["teamviewer.exe"] = "TeamViewer"
  l_0_3["teamviewer_service.exe"] = "TeamViewer"
  l_0_3["screenconnect.clientservice.exe"] = "ScreenConnect"
  l_0_3["splashtop.exe"] = "Splashtop"
  l_0_3["srstreamer.exe"] = "Splashtop"
  l_0_3["ateraagent.exe"] = "Atera"
  l_0_3["meshagent.exe"] = "MeshAgent"
  l_0_3["rustdesk.exe"] = "RustDesk"
  l_0_3["ninjarmmagent.exe"] = "NinjaOne"
  l_0_3["tacticalrmm.exe"] = "TacticalRMM"
  l_0_3["supremo.exe"] = "Supremo"
  l_0_3["ammyyadmin.exe"] = "AmmyyAdmin"
  l_0_3["zohoassist.exe"] = "ZohoAssist"
  l_0_3["dwagent.exe"] = "DWAgent"
  l_0_3["fleetdeck_agent_svc.exe"] = "Fleetdeck"
  l_0_3["pulseway.exe"] = "Pulseway"
  l_0_3["rfusclient.exe"] = "RemoteUtilities"
  l_0_3["rutserv.exe"] = "RemoteUtilities"
  l_0_3["simplehelp.exe"] = "SimpleHelp"
  l_0_3["action1_agent.exe"] = "Action1"
  l_0_3["logmein.exe"] = "LogMeIn"
  l_0_3["radmin.exe"] = "Radmin"
  l_0_3["mobaxterm.exe"] = "MobaXterm"
  l_0_3["syncromsp.exe"] = "Syncro"
  l_0_3["ehorus_agent.exe"] = "eHorus"
  l_0_3["aemagent.exe"] = "ManageEngineRMM"
  l_0_3["basupsrvc.exe"] = "NAble"
  l_0_3["rport.exe"] = "RPort"
  l_0_3["besclient.exe"] = "HCLBigFix"
  local l_0_4 = l_0_3[l_0_2]
  if l_0_4 == nil then
    return mp.CLEAN
  end
  if not IsDeviceHVA() then
    return mp.CLEAN
  end
  local l_0_5 = ExtractDeviceProperties()
  if l_0_5.DeviceRoles and (l_0_5.DeviceRoles).SharePointServer ~= nil then
    set_research_data("RMMToolProcOnHVA", l_0_4 .. "|" .. l_0_2, false)
    return mp.INFECTED
  end
  return mp.CLEAN
end


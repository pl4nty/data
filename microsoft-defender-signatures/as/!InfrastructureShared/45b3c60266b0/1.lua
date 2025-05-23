-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45b3c60266b0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (string.lower)(l_0_0.command_line)
if (string.find)(l_0_1, "\\program files", 1, true) or (string.find)(l_0_1, "\\netlogon\\", 1, true) or (string.find)(l_0_1, "\\sysvol\\", 1, true) or (string.find)(l_0_1, " -nologo ", 1, true) or (string.find)(l_0_1, " -noprofile ", 1, true) or (string.find)(l_0_1, " -noninteractive ", 1, true) or (string.find)(l_0_1, "mmdactionengine.ps1", 1, true) or (string.find)(l_0_1, "\\windows\\ccmcache\\", 1, true) or (string.find)(l_0_1, "\\packages\\plugins\\microsoft.azure.azuredefenderforservers.mde.windows\\", 1, true) or (string.find)(l_0_1, "\\drv\\tools\\global\\proactiveagent\\scripts", 1, true) then
  return mp.CLEAN
end
do
  if (string.find)(l_0_1, "https:..veeam") and (versioning.GetEngineBuild)() >= 16700 then
    local l_0_2 = (versioning.GetOrgID)()
    if l_0_2 ~= nil and l_0_2 ~= "" then
      l_0_2 = (string.lower)(l_0_2)
      if l_0_2 == "17758f83-f720-459f-a3dd-02f409178457" then
        return mp.CLEAN
      else
        if l_0_2 == "d7c7c745-195f-4223-9c7a-99fb420fd000" and (MpCommon.IsSampled)(100, false, true, true) == true then
          return mp.CLEAN
        end
      end
    end
  end
  local l_0_3 = GetTaintLevelHR()
  if l_0_3 == nil or l_0_3 ~= "Medium" and l_0_3 ~= "High" then
    return mp.CLEAN
  end
  if IsDetectionThresholdMet("BM") and (IsTacticObservedForPid("BM", "processinjection_target") or IsTacticObservedForPid("BM", "discovery")) then
    return mp.INFECTED
  end
  return mp.CLEAN
end


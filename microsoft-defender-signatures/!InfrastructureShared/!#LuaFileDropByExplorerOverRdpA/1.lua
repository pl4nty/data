-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFileDropByExplorerOverRdpA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(MpCommon.QuerySessionInformation, l_0_1, MpCommon.WTSIsRemoteSession)
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
local l_0_5, l_0_6 = pcall((MpCommon.QuerySessionInformation)(l_0_1, MpCommon.WTSClientAddress))
if l_0_5 ~= nil and l_0_6 ~= nil and l_0_6.Address ~= nil then
  local l_0_7 = false
  if (mp.get_mpattribute)("Lua:CloudBlockLevelGT3") then
    local l_0_8 = (mp.GetProcessCommandLine)(l_0_1)
    if l_0_8 == nil or l_0_8 == "" then
      return mp.CLEAN
    end
    l_0_7 = IsHostAttackServerCloudChk(l_0_6.Address, "Lua:FileDropByExplorerOverRdp.A", l_0_0, l_0_8, "RDPFileDrop")
  else
    do
      l_0_7 = IsHostAttackServer(l_0_6.Address)
      if l_0_7 then
        (mp.set_mpattribute)("Lua:FileFromAttackerServer")
        local l_0_9 = (string.format)("scenario:rdp_from_attackerserver;filepath:%s;attacksvr:%s", l_0_2, tostring(l_0_6.Address))
        TT_SendBMSigTrigger(l_0_1, "T1021.001", l_0_9)
        return mp.INFECTED
      end
      do
        TrackPidAndTechnique(l_0_1, "T1021.001", "is_remote_desktop_connection")
        if (mp.IsHipsRuleEnabled)("d1e49aac-8f56-4280-b9ba-993a6d77406c") or (mp.IsHipsRuleEnabled)("c1db55ab-c21a-4637-bb3f-a12568109d35") or (mp.get_mpattribute)("Lua:TT:DetectionThresholdMet") then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5d8b33732515d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = IsDeviceHVAWithAD()
if l_0_0 == true then
  local l_0_1 = {}
  local l_0_2 = (mp.GetScannedPPID)()
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_1 = getSessionInfo(l_0_2, "WsmMonitorForChange")
  set_research_data("HVASessionInfo", safeJsonSerialize(l_0_1), false)
  return mp.INFECTED
end
do
  return mp.CLEAN
end


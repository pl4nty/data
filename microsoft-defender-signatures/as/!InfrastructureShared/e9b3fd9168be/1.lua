-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e9b3fd9168be\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = IsDeviceHVAWithAD()
if l_0_0 == true then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = getSessionInfo(l_0_1, "WsqmTrack")
  set_research_data("HVASessionInfo", safeJsonSerialize(l_0_2), false)
  return mp.INFECTED
end
do
  return mp.CLEAN
end


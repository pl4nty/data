-- Threat: !InfrastructureShared
-- Name: 1c9d74b387103
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = false
_, l_0_1 = pcall(MpCommon.QuerySessionInformation, l_0_0, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = MpCommon.WTSClientProtocolType
  if l_0_2 == 2 then
    set_research_data("Protocol", "RDP", false)
    return mp.LOWFI
  end
end
local l_0_3 = GetRollingQueueKeys("ThreatsOnMachine_Lua")
if l_0_3 ~= nil and type(l_0_3) == "table" then
  local l_0_4 = 0
  local l_0_5 = "["
  for l_0_6, l_0_7 in ipairs(l_0_3) do
    l_0_5 = l_0_5 .. "|" .. l_0_7
    l_0_4 = l_0_4 + 1
  end
  if 0 < l_0_4 then
    set_research_data("ThreatsOnMachine", l_0_5, false)
    return mp.LOWFI
  end
end
return mp.CLEAN

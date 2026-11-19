-- Threat: !InfrastructureShared
-- Name: 15b3984bed44
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetRollingQueueKeys("SuspTransportAgent")
if l_0_0 ~= nil and type(l_0_0) == "table" then
  local l_0_1 = "["
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    l_0_1 = l_0_1 .. l_0_3 .. "|"
  end
  l_0_1 = l_0_1 .. "]"
  local l_0_4 = l_0_0[#l_0_0]
  bm.add_related_string("agent_list", l_0_1, bm.RelatedStringBMReport)
  bm.add_related_string("agentpath", l_0_4, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 5bb391791281
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if MpCommon.GetBehavioralNetworkBlocksSettings then
  local l_0_1, l_0_2 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
  if l_0_1 and l_0_2 and not isnull(l_0_2.State) then
    l_0_0 = l_0_2.State
  end
end
if not isnull(l_0_0) and l_0_0 == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
  return mp.INFECTED
end
return mp.CLEAN

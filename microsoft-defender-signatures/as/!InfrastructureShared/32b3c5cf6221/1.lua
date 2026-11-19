-- Threat: !InfrastructureShared
-- Name: 32b3c5cf6221
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_0 = l_0_1:match("remoteip=(%d+%.%d+%.%d+%.%d+);file1=([^;]+);file2=([^;]+)")
end
local l_0_2
if MpCommon.GetBehavioralNetworkBlocksSettings then
  local l_0_3, l_0_4 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
  if l_0_3 and l_0_4 and not isnull(l_0_4.State) then
    l_0_2 = l_0_4.State
  end
end
if not isnull(l_0_2) and l_0_2 == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
  local l_0_5 = 900
  local l_0_6, l_0_7 = pcall(bm.add_blocking_firewall_rule, l_0_0, l_0_5, true, false, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION, true, true)
  if l_0_6 == true and isnull(l_0_7) then
    return mp.INFECTED
  end
end
return mp.CLEAN

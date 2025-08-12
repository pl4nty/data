-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3abd7cc98\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_3, l_0_4 = nil
do
  if MpCommon.GetBehavioralNetworkBlocksSettings then
    local l_0_1, l_0_2 = , pcall(MpCommon.GetBehavioralNetworkBlocksSettings, MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION)
    if l_0_2 and MpCommon.GetBehavioralNetworkBlocksSettings and not isnull((MpCommon.GetBehavioralNetworkBlocksSettings).State) then
      l_0_1 = (MpCommon.GetBehavioralNetworkBlocksSettings).State
    end
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  if not isnull(l_0_1) and l_0_1 == MpCommon.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED then
    return mp.INFECTED
  end
  return mp.CLEAN
end


local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = MpCommon
L1_1 = L1_1.GetBehavioralNetworkBlocksSettings
if L1_1 then
  L1_1 = pcall
  L2_1 = MpCommon
  L2_1 = L2_1.GetBehavioralNetworkBlocksSettings
  L3_1 = MpCommon
  L3_1 = L3_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L1_1 and L2_1 then
    L3_1 = isnull
    L4_1 = L2_1.State
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L0_1 = L2_1.State
    end
  end
end
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED
  if L0_1 == L1_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

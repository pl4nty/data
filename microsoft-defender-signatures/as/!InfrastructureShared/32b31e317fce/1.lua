local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "remoteip=(%d+%.%d+%.%d+%.%d+);file1=([^;]+);file2=([^;]+)"
    L2_1 = L2_1(L3_1, L4_1)
    L0_1 = L2_1
  end
end
L1_1 = nil
L2_1 = MpCommon
L2_1 = L2_1.GetBehavioralNetworkBlocksSettings
if L2_1 then
  L2_1 = pcall
  L3_1 = MpCommon
  L3_1 = L3_1.GetBehavioralNetworkBlocksSettings
  L4_1 = MpCommon
  L4_1 = L4_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  if L2_1 and L3_1 then
    L4_1 = isnull
    L5_1 = L3_1.State
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L1_1 = L3_1.State
    end
  end
end
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.MP_BEHAVIORAL_NETWORK_BLOCK_ENABLED
  if L1_1 == L2_1 then
    L2_1 = 900
    L3_1 = pcall
    L4_1 = bm
    L4_1 = L4_1.add_blocking_firewall_rule
    L5_1 = L0_1
    L6_1 = L2_1
    L7_1 = true
    L8_1 = false
    L9_1 = MpCommon
    L9_1 = L9_1.MP_BEHAVIORAL_NETWORK_BLOCK_REMOTE_ENCRYPTION
    L10_1 = true
    L11_1 = true
    L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
    if L3_1 == true then
      L5_1 = isnull
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

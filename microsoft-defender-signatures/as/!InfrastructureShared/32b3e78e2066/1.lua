local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  L1_1 = split
  L2_1 = L0_1
  L3_1 = ","
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = {}
  
  function L3_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
    L1_2 = pairs
    L2_2 = A0_2
    L1_2, L2_2, L3_2 = L1_2(L2_2)
    for L4_2, L5_2 in L1_2, L2_2, L3_2 do
      L6_2 = MpCommon
      L6_2 = L6_2.Base64Decode
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      L7_2 = explode
      L8_2 = L6_2
      L9_2 = "_"
      L7_2 = L7_2(L8_2, L9_2)
      L6_2 = L7_2
      L7_2 = ipairs
      L8_2 = L6_2
      L7_2, L8_2, L9_2 = L7_2(L8_2)
      for L10_2, L11_2 in L7_2, L8_2, L9_2 do
        L12_2 = split
        L13_2 = L11_2
        L14_2 = ":"
        L12_2 = L12_2(L13_2, L14_2)
        L11_2 = L12_2
        L12_2 = pcall
        L13_2 = mp
        L13_2 = L13_2.GetPPidFromPid
        L14_2 = L11_2[1]
        L12_2, L13_2 = L12_2(L13_2, L14_2)
        L14_2 = L2_1
        L15_2 = L11_2[1]
        L16_2 = {}
        L16_2.success = L12_2
        L16_2.ppid = L13_2
        L14_2[L15_2] = L16_2
        if L12_2 then
          L14_2 = L11_2[2]
          L15_2 = bm
          L15_2 = L15_2.trigger_sig
          L16_2 = "Heimdall_ProcessActions"
          L17_2 = L14_2
          L18_2 = L13_2
          L15_2(L16_2, L17_2, L18_2)
        end
      end
    end
  end
  
  processActions = L3_1
  L3_1 = pcall
  L4_1 = processActions
  L5_1 = L1_1
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L5_1 = {}
    L5_1.error = L4_1
    L2_1.error = L5_1
    L2_1.TAG = "NOLOOKUP"
  end
  L5_1 = pcall
  L6_1 = mp
  L6_1 = L6_1.GetUrlReputation
  L7_1 = {}
  L8_1 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
  L7_1[1] = L8_1
  L8_1 = safeJsonSerialize
  L9_1 = L2_1
  L8_1, L9_1 = L8_1(L9_1)
  L5_1(L6_1, L7_1, L8_1, L9_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

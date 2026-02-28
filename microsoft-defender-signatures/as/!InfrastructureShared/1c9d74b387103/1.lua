local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
L1_1 = false
L2_1 = pcall
L3_1 = MpCommon
L3_1 = L3_1.QuerySessionInformation
L4_1 = L0_1
L5_1 = MpCommon
L5_1 = L5_1.WTSIsRemoteSession
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L3_1
_ = L2_1
if L1_1 then
  L2_1 = MpCommon
  L2_1 = L2_1.WTSClientProtocolType
  if L2_1 == 2 then
    L3_1 = set_research_data
    L4_1 = "Protocol"
    L5_1 = "RDP"
    L6_1 = false
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.LOWFI
    return L3_1
  end
end
L2_1 = GetRollingQueueKeys
L3_1 = "ThreatsOnMachine_Lua"
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = type
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 == "table" then
    L3_1 = 0
    L4_1 = "["
    L5_1 = ipairs
    L6_1 = L2_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = L4_1
      L11_1 = "|"
      L12_1 = L9_1
      L4_1 = L10_1 .. L11_1 .. L12_1
      L3_1 = L3_1 + 1
    end
    if 0 < L3_1 then
      L5_1 = set_research_data
      L6_1 = "ThreatsOnMachine"
      L7_1 = L4_1
      L8_1 = false
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = mp
      L5_1 = L5_1.LOWFI
      return L5_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

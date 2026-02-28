local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.StringRegExpSearch
L3_1 = "(?i)echo\\s+([A-Za-z0-9+/=]+)\\s*\\|\\s*base64\\s*-\\s*d"
L4_1 = L1_1
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.Base64Decode
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 ~= nil and L4_1 ~= "" then
    L5_1 = MpCommon
    L5_1 = L5_1.BmTriggerSig
    L6_1 = L0_1
    L7_1 = "XplatCmdB64"
    L8_1 = L4_1
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

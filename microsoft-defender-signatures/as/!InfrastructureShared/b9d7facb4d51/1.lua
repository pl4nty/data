local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L2_1 = {}
L3_1 = "(?:set|add)-mppreference\\s+-exclusionextension\\s+\\*\\.?(?:exe|dll)\\s"
L4_1 = "(?:set|add)-mppreference\\s+-exclusionextension\\s*['\"]?dll['\"]?"
L5_1 = "(?:set|add)-mppreference\\s+-exclusionprocess\\s+\\.?(?:exe|dll|regsvr32|rundll32|powershell|iexplore|explorer|msiexec)(?:.exe|\\s*|\\*)?"
L6_1 = "(?:set|add)-mppreference\\s+-exclusionextension\\s+@\\(['\"]?exe['\"]?,['\"]?dll['\"]?\\)\\s+"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L3_1 = false
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = MpCommon
  L9_1 = L9_1.StringRegExpSearch
  L10_1 = L8_1
  L11_1 = L1_1
  L9_1, L10_1 = L9_1(L10_1, L11_1)
  L7_1 = L10_1
  L3_1 = L9_1
  if L3_1 then
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    return L9_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

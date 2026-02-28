local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\\explorer.exe"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = #L3_1
  if not (L4_1 <= 50) then
    goto lbl_46
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_46::
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = "[\\.\\-]replace[\\s(]+['\"]([^'\"])+['\"]"
L5_1 = MpCommon
L5_1 = L5_1.StringRegExpSearch
L6_1 = L4_1
L7_1 = L3_1
L5_1, L6_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.gsub
L8_1 = L3_1
L9_1 = "%"
L10_1 = L6_1
L9_1 = L9_1 .. L10_1
L10_1 = ""
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
if not L7_1 or not L8_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L8_1 then
  L9_1 = tonumber
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 < 10 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L9_1 = contains
L10_1 = L7_1
L11_1 = {}
L12_1 = "curl"
L13_1 = "iex"
L14_1 = "http"
L15_1 = "invoke-expression"
L16_1 = "mshta"
L17_1 = "msiexec"
L11_1[1] = L12_1
L11_1[2] = L13_1
L11_1[3] = L14_1
L11_1[4] = L15_1
L11_1[5] = L16_1
L11_1[6] = L17_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "\\rundll32%.?e?x?e?(.*),%w+"
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L3_1 = L1_1
  L2_1 = L1_1.lower
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = contains
  L3_1 = L1_1
  L4_1 = {}
  L5_1 = ".dll"
  L6_1 = ".ocx"
  L7_1 = ".cpl"
  L8_1 = ".xla"
  L9_1 = ".xlam"
  L10_1 = ".xll"
  L11_1 = ".vsto"
  L12_1 = ".olb"
  L13_1 = "--no-sandbox"
  L14_1 = "zebra_default.dat"
  L15_1 = "program files"
  L16_1 = "sogoutsf.ime"
  L17_1 = ".ax"
  L18_1 = ".wll"
  L19_1 = "setupinfobjectinstallaction"
  L20_1 = "openas_rundll"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L4_1[4] = L8_1
  L4_1[5] = L9_1
  L4_1[6] = L10_1
  L4_1[7] = L11_1
  L4_1[8] = L12_1
  L4_1[9] = L13_1
  L4_1[10] = L14_1
  L4_1[11] = L15_1
  L4_1[12] = L16_1
  L4_1[13] = L17_1
  L4_1[14] = L18_1
  L4_1[15] = L19_1
  L4_1[16] = L20_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

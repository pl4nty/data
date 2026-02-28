local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = pehdr
if L0_1 ~= nil then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if L0_1 ~= nil then
    L0_1 = pesecs
    if L0_1 ~= nil then
      goto lbl_14
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.set_mpattribute
L2_1 = "Lua:Context/PeFileNumberOfSections!"
L3_1 = tostring
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L2_1 = L2_1 .. L3_1
L1_1(L2_1)
if L0_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = "Lua:Context/PeFileSection"
L2_1 = 1
L3_1 = L0_1
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = pesecs
  L6_1 = L6_1[L5_1]
  L6_1 = L6_1.Name
  L7_1 = pesecs
  L7_1 = L7_1[L5_1]
  L7_1 = L7_1.Name
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = L1_1
    L9_1 = tostring
    L10_1 = L5_1
    L9_1 = L9_1(L10_1)
    L10_1 = "!"
    L11_1 = string
    L11_1 = L11_1.lower
    L12_1 = L6_1
    L11_1 = L11_1(L12_1)
    L8_1 = L8_1 .. L9_1 .. L10_1 .. L11_1
    L7_1(L8_1)
  end
  if 8 <= L5_1 then
    break
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "RPF:MSVC:EH:LsHash"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.enum_mpattributesubstring
  L2_1 = "RPF:MSVC:EH:LsHash:"
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "RPF:DWARF:EH:LsHash"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.enum_mpattributesubstring
    L2_1 = "RPF:DWARF:EH:LsHash:"
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  else
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = {}
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L8_1 = L6_1
  L7_1 = L6_1.match
  L9_1 = ":EH:LsHash:(%x+):(%x+):(%x+)$"
  L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
  L10_1 = #L1_1
  L10_1 = L10_1 + 1
  L11_1 = {}
  L12_1 = tonumber
  L13_1 = L7_1
  L14_1 = 16
  L12_1 = L12_1(L13_1, L14_1)
  L13_1 = tonumber
  L14_1 = L8_1
  L15_1 = 16
  L13_1 = L13_1(L14_1, L15_1)
  L14_1 = L9_1
  L11_1[1] = L12_1
  L11_1[2] = L13_1
  L11_1[3] = L14_1
  L1_1[L10_1] = L11_1
end
L2_1 = table
L2_1 = L2_1.sort
L3_1 = L1_1

function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2[2]
  L3_2 = A1_2[2]
  L2_2 = L2_2 > L3_2
  return L2_2
end

L2_1(L3_1, L4_1)
L2_1 = {}
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  if 3 < L6_1 then
    break
  end
  L8_1 = #L2_1
  L8_1 = L8_1 + 1
  L9_1 = L7_1[3]
  L2_1[L8_1] = L9_1
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "MpInternal_researchdata=FuncLsHash:NC="
L5_1 = table
L5_1 = L5_1.concat
L6_1 = L2_1
L7_1 = ","
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1 .. L5_1
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

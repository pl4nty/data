local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "RPF:MSVC:EH:LogFuncSize"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.enum_mpattributesubstring
  L2_1 = "RPF:MSVC:EH:LogFuncSize:"
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "RPF:DWARF:EH:LogFuncSize"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.enum_mpattributesubstring
    L2_1 = "RPF:DWARF:EH:LogFuncSize:"
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
  L7_1 = #L1_1
  L7_1 = L7_1 + 1
  L9_1 = L6_1
  L8_1 = L6_1.match
  L10_1 = "RPF:MSVC:EH:LogFuncSize:(%d+:%d+)"
  L8_1 = L8_1(L9_1, L10_1)
  L1_1[L7_1] = L8_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpInternal_researchdata=LogFuncSize:CD="
L4_1 = table
L4_1 = L4_1.concat
L5_1 = L1_1
L6_1 = ";"
L4_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1 .. L4_1
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

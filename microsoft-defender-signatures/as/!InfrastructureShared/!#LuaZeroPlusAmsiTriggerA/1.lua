local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCRIPT:Ps"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "SCRIPT:PowerShell"
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "SCPT:ps"
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "SCPT:PowerShell"
L3_1 = L3_1(L4_1)
L4_1 = isnull
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = isnull
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = isnull
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = isnull
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
    end
  end
end
L4_1 = #L0_1
L5_1 = #L1_1
L4_1 = L4_1 + L5_1
L5_1 = #L2_1
L4_1 = L4_1 + L5_1
L5_1 = #L3_1
L4_1 = L4_1 + L5_1
if 10 <= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.ReportLowfi
    L3_1 = L1_1
    L4_1 = 2004662694
    L2_1(L3_1, L4_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

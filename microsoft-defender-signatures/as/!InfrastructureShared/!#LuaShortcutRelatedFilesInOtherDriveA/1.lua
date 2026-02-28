local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = tostring
  L2_1 = headerpage
  L1_1 = L1_1(L2_1)
  L2_1 = mp
  L2_1 = L2_1.GetExecutablesFromCommandLine
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = string
    L8_1 = L8_1.lower
    L9_1 = mp
    L9_1 = L9_1.ContextualExpandEnvironmentVariables
    L10_1 = L7_1
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.ReportLowfi
      L10_1 = L8_1
      L11_1 = 1875954900
      L9_1(L10_1, L11_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

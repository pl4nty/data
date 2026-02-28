local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1()
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "\\microsoft\\windows\\start menu\\programs\\startup.*%.lnk"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = tostring
    L4_1 = headerpage
    L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L3_1(L4_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
    L3_1 = mp
    L3_1 = L3_1.GetExecutablesFromCommandLine
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L4_1 = ipairs
    L5_1 = L3_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = mp
      L9_1 = L9_1.ContextualExpandEnvironmentVariables
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      L8_1 = L9_1
      L9_1 = sysio
      L9_1 = L9_1.IsFileExists
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.ReportLowfi
        L10_1 = L8_1
        L11_1 = 2199264473
        L9_1(L10_1, L11_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

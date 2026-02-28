local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsIISWmiAmsiScan"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = mp
L1_1 = L1_1.GetBruteMatchData
L1_1 = L1_1()
L2_1 = L1_1.is_header
if L2_1 then
  L2_1 = tostring
  L3_1 = headerpage
  L2_1 = L2_1(L3_1)
  L3_1 = L2_1
  L2_1 = L2_1.lower
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
else
  L2_1 = tostring
  L3_1 = footerpage
  L2_1 = L2_1(L3_1)
  L3_1 = L2_1
  L2_1 = L2_1.lower
  L2_1 = L2_1(L3_1)
  L0_1 = L2_1
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "setpropvalue.commandline%(\"(.*)\"%);"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = TT_SendBMSigTrigger
  L5_1 = L3_1
  L6_1 = "IISWMIExec"
  L7_1 = L2_1
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = set_research_data
L5_1 = "IISWMIExec"
L6_1 = L2_1
L7_1 = false
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1

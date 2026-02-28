local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpIsPowerShellAMSIScan"
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
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = headerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  L0_1 = L2_1
else
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = tostring
  L4_1 = footerpage
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  L0_1 = L2_1
end
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = "new-settingoverride"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L3_1 = L0_1
  L2_1 = L0_1.match
  L4_1 = "section amsirequestbodyscanning %-parameters @?%((.*)%)"
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
    L6_1 = "AMSIBodyScanControl"
    L7_1 = L2_1
    L8_1 = 1
    L4_1(L5_1, L6_1, L7_1, L8_1)
  end
  L4_1 = set_research_data
  L5_1 = "AMSIBodyScanControl"
  L6_1 = L2_1
  L7_1 = false
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

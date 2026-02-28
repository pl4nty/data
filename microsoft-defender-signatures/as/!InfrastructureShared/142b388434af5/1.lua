local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = IsTacticObservedGlobal
L1_1 = "credentialdumping_concrete"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.get_current_process_startup_info
  L0_1 = L0_1()
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L1_1
    L2_1(L3_1)
  end
  L2_1 = pcall
  L3_1 = reportBmInfo
  L2_1, L3_1 = L2_1(L3_1)
  if not L2_1 and L3_1 then
    L4_1 = bm
    L4_1 = L4_1.add_related_string
    L5_1 = "bmInfoFailReason"
    L6_1 = tostring
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    L7_1 = bm
    L7_1 = L7_1.RelatedStringBMReport
    L4_1(L5_1, L6_1, L7_1)
  end
  L4_1 = sms_untrusted_process
  L4_1()
  L4_1 = add_parents
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

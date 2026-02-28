local L0_1, L1_1, L2_1, L3_1
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
  L2_1 = sms_untrusted_process
  L2_1()
  L2_1 = add_parents
  L2_1()
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

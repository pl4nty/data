local L0_1, L1_1, L2_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.lower
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  L1_1 = bm_AddRelatedFileFromCommandLine
  L2_1 = L0_1
  L1_1(L2_1)
end
L0_1 = sms_untrusted_process
L0_1()
L0_1 = add_parents
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1

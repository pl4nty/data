local L0_1, L1_1, L2_1, L3_1
L0_1 = IsBasToolProcessForPpid
L1_1 = "CMDHSTR"
L2_1 = "SafeBreach"
L0_1 = L0_1(L1_1, L2_1)
if not L0_1 then
  L0_1 = IsBasToolProcessFoundInParents
  L1_1 = "CMDHSTR"
  L2_1 = "SafeBreach"
  L3_1 = 4
  L0_1 = L0_1(L1_1, L2_1, L3_1)
  if not L0_1 then
    goto lbl_18
  end
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "TEL:HackTool:Win32/ValidDomainAccounts.A!bas"
L0_1(L1_1)
::lbl_18::
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1

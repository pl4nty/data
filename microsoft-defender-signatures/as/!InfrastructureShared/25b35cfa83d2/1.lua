local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = 10
L1_1 = 5
L2_1 = "ssh_login_attempt"
L3_1 = MpCommon
L3_1 = L3_1.AtomicCounterValue
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = MpCommon
  L4_1 = L4_1.AtomicCounterSet
  L5_1 = L2_1
  L6_1 = 1
  L7_1 = L0_1
  L4_1(L5_1, L6_1, L7_1)
else
  L4_1 = MpCommon
  L4_1 = L4_1.AtomicCounterAdd
  L5_1 = L2_1
  L6_1 = 1
  L4_1 = L4_1(L5_1, L6_1)
  L4_1 = L4_1 + 1
  if L1_1 <= L4_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.AtomicCounterErase
    L6_1 = L2_1
    L5_1(L6_1)
    L5_1 = AddTechniqueGlobal
    L6_1 = "CredentialAccess_SshBruteForceIncoming"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

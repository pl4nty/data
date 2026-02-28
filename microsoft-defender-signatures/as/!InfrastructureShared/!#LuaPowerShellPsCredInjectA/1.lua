local L0_1, L1_1, L2_1
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:RefPeInject.A"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PsCredInject.A!NewWinLogonA"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:PsCredInject.A!NewWinLogonB"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_22
  end
end
L0_1 = L0_1 + 1
::lbl_22::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PsCredInject.A!ExistingWinLogon"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PsCredInject.A!Binary"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PsCredInject.A!BinaryDecode"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCRIPT:PsCredInject.A!BinaryInject"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
if 2 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:PowerShell/PsCredInject.A!suspicious"
  L1_1(L2_1)
end
if 4 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

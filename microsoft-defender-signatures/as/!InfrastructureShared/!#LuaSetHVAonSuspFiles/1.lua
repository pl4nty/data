local L0_1, L1_1
L0_1 = IsDeviceHVA
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsActiveDirectoryRole
  L0_1 = L0_1()
  if not L0_1 then
    goto lbl_13
  end
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "Lua:IsDeviceHVA"
L0_1(L1_1)
::lbl_13::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

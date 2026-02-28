local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "svchost.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = IsDeviceHVA
    L1_1 = L1_1()
    if not L1_1 then
      L1_1 = IsActiveDirectoryRole
      L1_1 = L1_1()
      if not L1_1 then
        goto lbl_32
      end
    end
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:IsDeviceHVA"
    L1_1(L2_1)
  end
end
::lbl_32::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

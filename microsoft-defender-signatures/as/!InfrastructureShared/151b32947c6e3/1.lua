local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = IsKeyInRollingQueue
L1_1 = "KernelCallBackAddress"
L2_1 = "fn_AddressRange_min"
L3_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 then
  L0_1 = IsKeyInRollingQueue
  L1_1 = "KernelCallBackAddress"
  L2_1 = "fn_AddressRange_max"
  L3_1 = true
  L0_1 = L0_1(L1_1, L2_1, L3_1)
  if L0_1 then
    goto lbl_18
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_18::
L0_1 = this_sigattrlog
L0_1 = L0_1[7]
L0_1 = L0_1.utf8p2
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.ppid
L2_1 = nil
L3_1 = string
L3_1 = L3_1.find
L4_1 = L0_1
L5_1 = "vmbaseaddress:(%d+);"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
L2_1 = L5_1
_ = L4_1
_ = L3_1
L3_1 = tonumber
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = tonumber
L4_1 = GetRollingQueueKeyValue
L5_1 = "KernelCallBackAddress"
L6_1 = "fn_AddressRange_min"
L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
L4_1 = tonumber
L5_1 = GetRollingQueueKeyValue
L6_1 = "KernelCallBackAddress"
L7_1 = "fn_AddressRange_max"
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1)
if not (L2_1 and L4_1) or not L3_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L2_1 <= L4_1 and L2_1 >= L3_1 then
  L5_1 = bm
  L5_1 = L5_1.add_related_process
  L6_1 = L1_1
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

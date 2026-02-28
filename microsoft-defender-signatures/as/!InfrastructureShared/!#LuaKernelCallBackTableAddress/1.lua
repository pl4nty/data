local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = {}
  L3_2 = 1
  L4_2 = 0
  L5_2 = A1_2 - 1
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = mp
    L8_2 = L8_2.readu_u64
    L9_2 = A0_2
    L10_2 = 8 * L7_2
    L10_2 = L10_2 + 1
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = false
    if L8_2 == 0 then
      L9_2 = true
    else
      L10_2 = mp
      L10_2 = L10_2.bitand
      L11_2 = L8_2
      L12_2 = -1099511627776
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 < 139637976727552 then
        L9_2 = false
      else
        L2_2[L3_2] = L8_2
        L9_2 = true
        L3_2 = L3_2 + 1
      end
    end
    if L9_2 == false then
      L2_2[1] = 3735928559
      return L2_2
    end
  end
  return L2_2
end

check_KCT_table_x64 = L0_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = #A0_2
  L2_2 = {}
  L2_2.min = 1
  L2_2.max = 2
  if L1_2 == 1 then
    L3_2 = A0_2[1]
    L2_2.max = L3_2
    L3_2 = A0_2[1]
    L2_2.min = L3_2
    return L2_2
  end
  L3_2 = A0_2[1]
  L4_2 = A0_2[2]
  if L3_2 > L4_2 then
    L3_2 = A0_2[1]
    L2_2.max = L3_2
    L3_2 = A0_2[2]
    L2_2.min = L3_2
  else
    L3_2 = A0_2[2]
    L2_2.max = L3_2
    L3_2 = A0_2[1]
    L2_2.min = L3_2
  end
  L3_2 = 3
  L4_2 = L1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = A0_2[L6_2]
    L8_2 = L2_2.max
    if L7_2 > L8_2 then
      L7_2 = A0_2[L6_2]
      L2_2.max = L7_2
    else
      L7_2 = A0_2[L6_2]
      L8_2 = L2_2.min
      if L7_2 < L8_2 then
        L7_2 = A0_2[L6_2]
        L2_2.min = L7_2
      end
    end
  end
  return L2_2
end

getArrayMinMax = L0_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "KernelCallBackTableObtained"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = MpCommon
L0_1 = L0_1.GetTickCount64
L0_1 = L0_1()
L1_1 = 0
L2_1 = IsKeyInRollingQueue
L3_1 = "KernelCallBackAddress"
L4_1 = "Recorded_Time"
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = tonumber
  L3_1 = GetRollingQueueKeyValue
  L4_1 = "KernelCallBackAddress"
  L5_1 = "Recorded_Time"
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
  L1_1 = L2_1
end
L2_1 = IsKeyInRollingQueue
L3_1 = "KernelCallBackAddress"
L4_1 = "fn_AddressRange_min"
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = IsKeyInRollingQueue
  L3_1 = "KernelCallBackAddress"
  L4_1 = "fn_AddressRange_max"
  L5_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 and L1_1 ~= 0 and L0_1 > L1_1 and 86400000 < L0_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetPEBAddress
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetSMSProcArchitecture
L4_1 = L4_1()
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.SMS_PROC_ARCH_X64
if L4_1 ~= L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.ReadProcMem
L6_1 = L3_1 + 88
L7_1 = 8
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.readu_u64
L7_1 = L5_1
L8_1 = 1
L6_1 = L6_1(L7_1, L8_1)
L7_1 = 128
L8_1 = mp
L8_1 = L8_1.ReadProcMem
L9_1 = L6_1
L10_1 = L7_1 * 8
L8_1 = L8_1(L9_1, L10_1)
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = check_KCT_table_x64
L10_1 = L8_1
L11_1 = L7_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 == nil then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
else
  L10_1 = #L9_1
  if L10_1 == 0 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  else
    L10_1 = L9_1[1]
    if L10_1 == 3735928559 then
      L10_1 = mp
      L10_1 = L10_1.GetProcessCommandLine
      L11_1 = L2_1
      L10_1 = L10_1(L11_1)
      L11_1 = mp
      L11_1 = L11_1.set_mpattribute
      L12_1 = string
      L12_1 = L12_1.format
      L13_1 = "MpInternal_researchdata=Modified KCT=%s"
      L14_1 = string
      L14_1 = L14_1.lower
      L15_1 = L10_1
      L14_1, L15_1, L16_1, L17_1 = L14_1(L15_1)
      L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
      L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
      L11_1 = mp
      L11_1 = L11_1.set_mpattribute
      L12_1 = "KernelCallBackTableObtained"
      L11_1(L12_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    else
      L10_1 = getArrayMinMax
      L11_1 = L9_1
      L10_1 = L10_1(L11_1)
      L11_1 = L10_1.min
      L12_1 = L10_1.max
      L13_1 = pcall
      L14_1 = MpCommon
      L14_1 = L14_1.RollingQueueErase
      L15_1 = "KernelCallBackAddress"
      L13_1(L14_1, L15_1)
      L13_1 = AppendToRollingQueue
      L14_1 = "KernelCallBackAddress"
      L15_1 = "fn_AddressRange_min"
      L16_1 = L11_1
      L17_1 = 31536000
      L13_1(L14_1, L15_1, L16_1, L17_1)
      L13_1 = AppendToRollingQueue
      L14_1 = "KernelCallBackAddress"
      L15_1 = "fn_AddressRange_max"
      L16_1 = L12_1
      L17_1 = 31536000
      L13_1(L14_1, L15_1, L16_1, L17_1)
      L13_1 = AppendToRollingQueue
      L14_1 = "KernelCallBackAddress"
      L15_1 = "Recorded_Time"
      L16_1 = L0_1
      L17_1 = 31536000
      L13_1(L14_1, L15_1, L16_1, L17_1)
    end
  end
end
L10_1 = mp
L10_1 = L10_1.set_mpattribute
L11_1 = "KernelCallBackTableObtained"
L10_1(L11_1)
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1

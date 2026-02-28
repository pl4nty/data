local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = GetRollingQueue
L1_1 = "CheckNtdsSize"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = IsActiveDirectoryRole
L0_1 = L0_1()
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = false
L1_1 = sysio
L1_1 = L1_1.RegOpenKey
L2_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\NTDS\\Parameters"
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = sysio
L2_1 = L2_1.GetRegValueAsString
L3_1 = L1_1
L4_1 = "DSA Database File"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "ntds.dit"
  L6_1 = -8
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = sysio
    L3_1 = L3_1.GetFileSize
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if 10737418240 < L3_1 then
      L0_1 = true
    end
  end
end
L3_1 = "CheckNtdsSize"
L4_1 = 604800
L5_1 = AppendToRollingQueue
L6_1 = L3_1
L7_1 = "ntds.dit"
L8_1 = 1
L9_1 = L4_1
L5_1(L6_1, L7_1, L8_1, L9_1)
if L0_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

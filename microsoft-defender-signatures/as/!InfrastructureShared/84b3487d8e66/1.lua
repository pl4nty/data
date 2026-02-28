local L0_1, L1_1, L2_1, L3_1
L0_1 = IsActiveDirectoryRole
L0_1 = L0_1()
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = sysio
L0_1 = L0_1.RegOpenKey
L1_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\NTDS\\Parameters"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = sysio
  L1_1 = L1_1.GetRegValueAsString
  L2_1 = L0_1
  L3_1 = "DSA Database File"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil then
    L2_1 = sysio
    L2_1 = L2_1.GetFileSize
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if 51200000 < L2_1 then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

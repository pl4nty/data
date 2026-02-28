local L0_1, L1_1, L2_1
L0_1 = false
L1_1 = IsDeviceHVA
L1_1 = L1_1()
if L1_1 then
  L1_1 = ExtractDeviceProperties
  L1_1 = L1_1()
  L2_1 = L1_1.DeviceRoles
  if L2_1 then
    L2_1 = L1_1.DeviceRoles
    L2_1 = L2_1.DomainController
    if L2_1 ~= nil then
      L0_1 = true
    end
  end
end
if not L0_1 then
  L1_1 = IsActiveDirectoryRole
  L1_1 = L1_1()
  if L1_1 then
    L0_1 = true
  end
end
if L0_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

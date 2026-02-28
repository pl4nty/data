local L0_1, L1_1
L0_1 = IsDeviceHVA
L0_1 = L0_1()
if L0_1 then
  L0_1 = ExtractDeviceProperties
  L0_1 = L0_1()
  L1_1 = L0_1.DeviceRoles
  if L1_1 then
    L1_1 = L0_1.DeviceRoles
    L1_1 = L1_1.DomainController
    if L1_1 ~= nil then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

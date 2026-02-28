local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = IsDeviceHVA
L0_1 = L0_1()
if L0_1 then
  L0_1 = ExtractDeviceProperties
  L0_1 = L0_1()
  L1_1 = L0_1.DeviceRoles
  if L1_1 ~= nil then
    L1_1 = IsProcNameInParentProcessTree
    L2_1 = "cmdhstr"
    L3_1 = "ltsvc.exe"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = {}
    L2_1 = "winrshost.exe"
    L3_1 = "wsmprovhost.exe"
    L4_1 = "wmiprvse.exe"
    L5_1 = "rundll32.exe"
    L1_1[1] = L2_1
    L1_1[2] = L3_1
    L1_1[3] = L4_1
    L1_1[4] = L5_1
    L2_1 = IsProcNameInParentProcessTree
    L3_1 = "cmdhstr"
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

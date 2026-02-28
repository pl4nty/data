local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
    if L2_1 == nil then
      L2_1 = L1_1.DeviceRoles
      L2_1 = L2_1.Dns
      if L2_1 == nil then
        goto lbl_20
      end
    end
    L0_1 = true
  end
end
::lbl_20::
if not L0_1 then
  L1_1 = IsActiveDirectoryRole
  L1_1 = L1_1()
  if L1_1 then
    L0_1 = true
  end
end
if L0_1 then
  L1_1 = mp
  L1_1 = L1_1.GetScannedPPID
  L1_1 = L1_1()
  if not L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = MpCommon
  L2_1 = L2_1.GetImagePathFromPid
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    L5_1 = "esentutl.exe"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = mp
      L4_1 = L4_1.GetProcessCommandLine
      L5_1 = L1_1
      L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
      L4_1 = isnull
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "/y "
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "/vss "
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

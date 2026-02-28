local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p2
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "ifm"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "activate "
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "ac "
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "act "
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_132
        end
      end
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "instance "
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "in "
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "i "
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "inst "
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            goto lbl_132
          end
        end
      end
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "create full"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "cr fu"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_132
      end
    end
    L1_1 = {}
    L2_1 = "wsmprovhost.exe"
    L3_1 = "wmiprvse.exe"
    L4_1 = "explorer.exe"
    L1_1[1] = L2_1
    L1_1[2] = L3_1
    L1_1[3] = L4_1
    L2_1 = IsProcNameInParentProcessTree
    L3_1 = "BM"
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = IsDeviceHVA
      L2_1 = L2_1()
      if L2_1 then
        L2_1 = ExtractDeviceProperties
        L2_1 = L2_1()
        L3_1 = L2_1.DeviceRoles
        if L3_1 then
          L3_1 = L2_1.DeviceRoles
          L3_1 = L3_1.DomainController
          if L3_1 ~= nil then
            L3_1 = mp
            L3_1 = L3_1.INFECTED
            return L3_1
          end
        end
      end
    end
  end
end
::lbl_132::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

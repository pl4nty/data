local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.FileDescription
L2_1 = L0_1.CompanyName
if L1_1 and L2_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L1_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "command center agent"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "ncr corporation"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "radiant systems"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        goto lbl_59
      end
    end
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:AlohaCommandCenter1"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
  ::lbl_59::
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L1_1
  L5_1 = "rdfclient"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "ncr corporation"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "radiant systems"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        goto lbl_93
      end
    end
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:AlohaCommandCenter2"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
::lbl_93::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

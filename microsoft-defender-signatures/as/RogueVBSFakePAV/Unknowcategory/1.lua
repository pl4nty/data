local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 1024 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 33328 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 5
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 2250901766 then
  L0_1 = mp
  L0_1 = L0_1.readu_u32
  L1_1 = headerpage
  L2_1 = 9
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == 234325576 then
    L0_1 = mp
    L0_1 = L0_1.readu_u16
    L1_1 = headerpage
    L2_1 = 13
    L0_1 = L0_1(L1_1, L2_1)
    if L0_1 == 1793 then
      L0_1 = headerpage
      L0_1 = L0_1[15]
      if L0_1 == 2 then
        goto lbl_46
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_46::
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "Lua:SignedVBEVBSFile"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 or not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\006\t*\134H\134\247\r\001\t\001"
L6_1 = 176
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.crc32
L5_1 = -1
L6_1 = L2_1
L7_1 = L3_1
L8_1 = 128
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == 1253964061 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 2001072022 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 528523446 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 436171478 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3846734772 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 2453401516 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 1904120670 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 1282814643 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3099783027 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 1988786358 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 2685115694 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3427567834 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 1626672047 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 216580452 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3328643055 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 2585924740 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3984502722 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3084158829 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 642584810 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 2067526196 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 2955266051 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3877293981 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 559314150 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 2836382494 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3206025137 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 4272565023 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 260598575 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 3431717411 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 994572658 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
if L4_1 == 4158500031 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "RPF:AnyFileHasIOAVURL"
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.UfsGetMetadataBool
L6_1 = "Lua:SignedVBEVBSTopFile"
L7_1 = true
L5_1, L6_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 0 or not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L8_1 = L2_1
L7_1 = L2_1.find
L9_1 = "\006\003U\004\n\f\bPersonal1.0.\006\003U\004\003\f.Open Source Developer,"
L10_1 = L3_1 - 96
L11_1 = false
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 ~= nil then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L9_1 = L2_1
L8_1 = L2_1.find
L10_1 = "\006\003U\004\n\f\nIndividual1.0.\006\003U\004\003\f.Open Source Developer,"
L11_1 = L3_1 - 96
L12_1 = false
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
L7_1 = L8_1
if L7_1 ~= nil then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L9_1 = L2_1
L8_1 = L2_1.find
L10_1 = "1.0.\006\003U\004\003\f.Open Source Developer,"
L11_1 = L3_1 - 96
L12_1 = false
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
L7_1 = L8_1
if L7_1 ~= nil then
  L9_1 = L2_1
  L8_1 = L2_1.find
  L10_1 = "1.0.\006\003U\004\v\019\030Certum Certification Authority1.0.\006\003U\004\003\019\019Certum Level III CA"
  L11_1 = 176
  L12_1 = false
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  L7_1 = L8_1
  if L7_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1

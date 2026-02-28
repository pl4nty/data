local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 100000000 < L0_1 and L0_1 < 135000000 then
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = headerpage
  L3_1 = 1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= 67324752 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.readprotection
  L2_1 = false
  L1_1(L2_1)
  L1_1 = 276
  L2_1 = mp
  L2_1 = L2_1.readfile
  L3_1 = L0_1 - L1_1
  L4_1 = L1_1
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = mp
  L3_1 = L3_1.readprotection
  L4_1 = true
  L3_1(L4_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = ".msi"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_HAS_MOTW_ADS
  L4_1 = L4_1(L5_1)
  if L4_1 ~= true then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.GetMOTWZone
  L4_1 = L4_1()
  if L4_1 < 3 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.GetMOTWHostUrl
  L4_1 = L4_1()
  if L4_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = "4sync.com"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "4shared.com"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        goto lbl_93
      end
    end
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
::lbl_93::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

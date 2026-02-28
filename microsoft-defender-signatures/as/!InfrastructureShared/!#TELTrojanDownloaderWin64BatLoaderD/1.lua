local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 100000000 < L0_1 and L0_1 < 135000000 then
  L1_1 = mp
  L1_1 = L1_1.readu_u64
  L2_1 = headerpage
  L3_1 = 1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= -2226271756974174208 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
  L1_1 = L1_1(L2_1)
  if L1_1 ~= true then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.GetMOTWZone
  L1_1 = L1_1()
  if L1_1 < 3 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.GetMOTWHostUrl
  L1_1 = L1_1()
  if L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "4sync.com"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "4shared.com"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_62
      end
    end
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_62::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

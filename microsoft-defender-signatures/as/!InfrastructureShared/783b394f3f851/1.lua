local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = L0_1
L2_1 = 1
L3_1 = -1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = sigattr_tail
  L5_1 = L5_1[L4_1]
  L5_1 = L5_1.attribute
  if L5_1 == 16491 then
    L5_1 = sigattr_tail
    L5_1 = L5_1[L4_1]
    L5_1 = L5_1.utf8p1
    if L5_1 == "GenericRansomware:Type2" then
      L5_1 = bm
      L5_1 = L5_1.set_detection_string
      L6_1 = sigattr_tail
      L6_1 = L6_1[L4_1]
      L6_1 = L6_1.utf8p2
      L5_1(L6_1)
      L5_1 = addDisruptionInfo
      L6_1 = true
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

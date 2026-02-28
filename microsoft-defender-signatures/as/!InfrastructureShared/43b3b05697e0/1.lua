local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
  end
end
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "imagepath:([^;]+)"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L2_1 = isTainted
    L3_1 = L1_1
    L4_1 = "upx_file_created_taint"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
    L2_1 = isTainted
    L3_1 = L1_1
    L4_1 = "remote_file_created_taint"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

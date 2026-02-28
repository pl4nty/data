local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[7]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[7]
    L0_1 = L0_1.utf8p2
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "^/var/www/"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = bm
    L1_1 = L1_1.add_related_file
    L2_1 = L0_1
    L1_1(L2_1)
  end
end
L0_1 = addRelatedProcess
L0_1()
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1190"
L3_1 = "InitialAccess_www"
L0_1(L1_1, L2_1, L3_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1

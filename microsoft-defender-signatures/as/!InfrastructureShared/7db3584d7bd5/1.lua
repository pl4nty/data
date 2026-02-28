local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L0_1 = L1_1.utf8p1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L0_1 = L1_1.utf8p1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[6]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L0_1 = L1_1.utf8p1
      end
    end
  end
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "/Users/.*/Library/"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1546.004"
  L4_1 = "profile-persistence"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

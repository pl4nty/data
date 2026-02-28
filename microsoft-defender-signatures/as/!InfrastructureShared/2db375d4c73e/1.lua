local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p1
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == ".php" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 0
  L4_1 = 9
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 == "/var/www/" then
    L1_1 = sysio
    L1_1 = L1_1.IsFileExists
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = bm
      L1_1 = L1_1.add_related_file
      L2_1 = L0_1
      L1_1(L2_1)
    end
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = "BM"
    L3_1 = "T1505.003"
    L4_1 = "Persistence_Webshell"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

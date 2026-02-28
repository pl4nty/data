local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p1
end
L1_1 = isTainted
L2_1 = L0_1
L3_1 = "remote_file_created_taint"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "/home/"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 ~= 1 then
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = "BM"
    L3_1 = "T1098.004"
    L4_1 = "Persistence"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 0
L4_1 = 5
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 ~= "/tmp/" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 0
  L4_1 = 9
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 ~= "/var/tmp/" then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = 0
    L4_1 = 9
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 ~= "/dev/shm/" then
      goto lbl_64
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1098.004"
L4_1 = "Persistence"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_64::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L0_1 = L4_1.ppid
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L0_1 = L4_1.ppid
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L0_1 = L4_1.ppid
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L2_1 = L4_1.utf8p1
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L2_1 = L4_1.utf8p1
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      L2_1 = L4_1.utf8p1
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[7]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[7]
  L1_1 = L4_1.ppid
end
L4_1 = this_sigattrlog
L4_1 = L4_1[8]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[8]
  L3_1 = L4_1.utf8p1
end
if L0_1 == nil or L1_1 == nil or L2_1 == nil or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = isTainted
L5_1 = L2_1
L6_1 = "remote_file_created_taint"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = taint
  L5_1 = L3_1
  L6_1 = "remote_file_created_taint"
  L7_1 = 3600
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = "BM"
  L6_1 = "T1105"
  L7_1 = "CommandAndControl"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

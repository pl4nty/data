local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = "remote_file_created_taint"
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L1_1 = L5_1.ppid
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L1_1 = L5_1.ppid
  else
    L5_1 = this_sigattrlog
    L5_1 = L5_1[3]
    L5_1 = L5_1.matched
    if L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[3]
      L1_1 = L5_1.ppid
    end
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[4]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[4]
  L3_1 = L5_1.utf8p1
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[5]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[5]
    L3_1 = L5_1.utf8p1
  else
    L5_1 = this_sigattrlog
    L5_1 = L5_1[6]
    L5_1 = L5_1.matched
    if L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[6]
      L3_1 = L5_1.utf8p1
    end
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[7]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[7]
  L2_1 = L5_1.ppid
end
L5_1 = this_sigattrlog
L5_1 = L5_1[8]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[8]
  L4_1 = L5_1.utf8p1
end
if L1_1 == nil or L2_1 == nil or L3_1 == nil or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = isTainted
L6_1 = L3_1
L7_1 = L0_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = taint
  L6_1 = L4_1
  L7_1 = L0_1
  L8_1 = 3600
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = "BM"
  L7_1 = "T1105"
  L8_1 = "CommandAndControl"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 6000000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.timestamp
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L0_1 = L3_1.timestamp
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p1
      L3_1 = L3_1(L4_1)
      L1_1 = L3_1
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L2_1 = L3_1.ppid
    end
  end
end
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[4]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[4]
  L5_1 = L5_1.timestamp
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[4]
    L5_1 = L5_1.utf8p1
    if L5_1 ~= nil then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[4]
      L3_1 = L5_1.timestamp
      L5_1 = string
      L5_1 = L5_1.lower
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L6_1 = L6_1.utf8p1
      L5_1 = L5_1(L6_1)
      L4_1 = L5_1
    end
  end
end
if L1_1 == L4_1 and L0_1 < L3_1 then
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = L2_1
  L7_1 = "susp_spoolhack"
  L8_1 = "priteshel_a"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

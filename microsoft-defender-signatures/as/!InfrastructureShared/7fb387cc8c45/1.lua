local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L1_1 = L3_1.utf8p1
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L0_1 = L3_1.utf8p2
    end
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L4_1 = L4_1.utf8p2
    L5_1 = "TargetPPID:(%d+):"
    L3_1 = L3_1(L4_1, L5_1)
    L2_1 = L3_1
  end
end
if L0_1 == nil or L2_1 == nil or L1_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pcall
L4_1 = mp
L4_1 = L4_1.GetPPidFromPid
L5_1 = L2_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if L3_1 == false or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = IsPEBSpoofed
L6_1 = L4_1
L7_1 = L1_1
L8_1 = L0_1
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == true then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1

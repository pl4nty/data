local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p2
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L0_1 = L2_1.utf8p2
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L1_1 = L2_1.utf8p1
    end
  end
end
L2_1 = false
if L0_1 == "THREAT" then
  L2_1 = true
end
if L0_1 == "THREAT" then
  L3_1 = 5
  if L3_1 then
    goto lbl_44
  end
end
L3_1 = 1
::lbl_44::
L4_1 = AppendToRollingQueue
L5_1 = "RecentThreatsOnMachine"
L6_1 = L1_1
L7_1 = L3_1
L8_1 = 1800
L9_1 = 100
L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = bm
L5_1 = L5_1.get_imagepath
L5_1, L6_1, L7_1, L8_1, L9_1 = L5_1()
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = sysio
L5_1 = L5_1.IsPathAVExcluded
L6_1 = L4_1
L7_1 = false
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == true then
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "isBMConcrete"
  L7_1 = tostring
  L8_1 = L2_1
  L7_1 = L7_1(L8_1)
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

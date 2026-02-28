local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      goto lbl_19
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_19::
L0_1 = string
L0_1 = L0_1.match
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.utf8p2
if not L1_1 then
  L1_1 = ""
end
L2_1 = " user (.-) "
L0_1 = L0_1(L1_1, L2_1)
L1_1 = string
L1_1 = L1_1.match
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.utf8p2
if not L2_1 then
  L2_1 = ""
end
L3_1 = "([^ ]+) /add"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.utf8p2
if not L3_1 then
  L3_1 = ""
end
L4_1 = "([^ ]+) /add"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = isnull
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not L3_1 and L0_1 == L1_1 and L0_1 == L2_1 then
      goto lbl_71
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_71::
L3_1 = {}
L3_1["T1098.007"] = "persist_user_local"
L3_1["T1136.001"] = "persist_user_local"
L4_1 = TrackPidAndMultipleTechniquesBM
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.ppid
L6_1 = L3_1
L4_1(L5_1, L6_1)
L4_1 = TrackPidAndMultipleTechniquesBM
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L5_1 = L5_1.ppid
L6_1 = L3_1
L4_1(L5_1, L6_1)
L4_1 = TrackPidAndMultipleTechniquesBM
L5_1 = this_sigattrlog
L5_1 = L5_1[3]
L5_1 = L5_1.ppid
L6_1 = L3_1
L4_1(L5_1, L6_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1

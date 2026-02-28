local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L1_1["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
L1_1["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
L1_1["313091c0-1f10-4d61-9655-068742b3534f"] = true
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L2_1 = L1_1[L2_1]
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p1
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      goto lbl_44
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_44::
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.utf8p2
L3_1 = #L2_1
if 500 <= L3_1 then
  L3_1 = bm
  L3_1 = L3_1.set_detection_string
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1, L5_1 = L4_1(L5_1)
  L3_1(L4_1, L5_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

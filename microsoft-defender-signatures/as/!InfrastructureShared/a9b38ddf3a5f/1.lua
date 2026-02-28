local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
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
L2_1 = pcall
L3_1 = GetRollingQueue
L4_1 = "evil_queue"
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L4_1 = isnull
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_40
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_40::
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p1
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p2
    if L4_1 then
      goto lbl_58
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_58::
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.utf8p1
L5_1 = this_sigattrlog
L5_1 = L5_1[4]
L5_1 = L5_1.utf8p2
L6_1 = #L5_1
if 500 <= L6_1 then
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L4_1
  L6_1 = L6_1(L7_1)
  L7_1 = ipairs
  L8_1 = L3_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = string
    L12_1 = L12_1.find
    L13_1 = L6_1
    L14_1 = tostring
    L15_1 = L11_1.key
    L14_1, L15_1 = L14_1(L15_1)
    L12_1 = L12_1(L13_1, L14_1, L15_1)
    if L12_1 then
      L12_1 = mp
      L12_1 = L12_1.INFECTED
      return L12_1
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1

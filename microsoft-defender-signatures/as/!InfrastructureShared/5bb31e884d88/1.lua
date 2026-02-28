local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L2_1 = "RcloneMega"
L3_1 = "|"
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L0_1 = L4_1.utf8p1
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L1_1 = L4_1.ppid
    end
  end
end
L4_1 = L0_1
L5_1 = L3_1
L6_1 = L1_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = GetRollingQueueKeyValue
L6_1 = L2_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = type
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 ~= "table" then
    goto lbl_48
  end
end
L6_1 = bm
L6_1 = L6_1.add_related_string
L7_1 = L2_1
L8_1 = safeJsonSerialize
L9_1 = L5_1
L8_1 = L8_1(L9_1)
L9_1 = bm
L9_1 = L9_1.RelatedStringBMReport
L6_1(L7_1, L8_1, L9_1)
::lbl_48::
L6_1 = reportSessionInformation
L6_1()
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1

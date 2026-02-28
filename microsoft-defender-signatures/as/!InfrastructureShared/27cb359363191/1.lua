local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L3_1 = this_sigattrlog
L3_1 = L3_1[12]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[12]
  L2_1 = L3_1.utf8p1
  L4_1 = L2_1
  L3_1 = L2_1.match
  L5_1 = "([^\\]+)$"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = ""
  end
  L5_1 = L3_1
  L4_1 = L3_1.match
  L6_1 = "^(.+)%.([^%.]+)$"
  L4_1, L5_1 = L4_1(L5_1, L6_1)
  if L5_1 then
    L6_1 = contains
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    L8_1 = {}
    L9_1 = "exe"
    L10_1 = "dll"
    L8_1[1] = L9_1
    L8_1[2] = L10_1
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 then
      goto lbl_35
    end
  end
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
::lbl_35::
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[5]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[5]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[5]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[6]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[7]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[8]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[9]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[9]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[9]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[10]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[10]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[10]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[11]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[11]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[11]
  L0_1 = L3_1.utf8p1
end
if not (L2_1 and L1_1) or not L0_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "InjectionType"
L5_1 = L1_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "InjectedIn"
L5_1 = L0_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "File_Created"
L5_1 = L2_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1

local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L0_1 = L1_1.utf8p2
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L0_1 = L1_1.utf8p2
        end
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 62) then
    goto lbl_60
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_60::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "whoami.exe"
L3_1[1] = L4_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "W3WPCommand"
  L3_1 = tostring
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L0_1 = L2_1.utf8p1
  end
end
if L0_1 ~= nil and L0_1 ~= "" and L1_1 ~= nil and L1_1 ~= "" then
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^/\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L4_1 = L2_1
  L3_1 = L2_1.match
  L5_1 = "^(.*)(%.[^%.]+)$"
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  L6_1 = L0_1
  L5_1 = L0_1.match
  L7_1 = "([^/\\]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  L7_1 = L5_1
  L6_1 = L5_1.match
  L8_1 = "^(.*)(%.[^%.]+)$"
  L6_1, L7_1 = L6_1(L7_1, L8_1)
  L5_1 = L6_1 or L5_1
  if not L6_1 then
  end
  if L7_1 ~= ".cpt" then
    L8_1 = isKnownRansomExtension
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      if L5_1 ~= L2_1 and L5_1 ~= L3_1 then
        L8_1 = StringStartsWith
        L9_1 = L3_1
        L10_1 = L5_1
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          goto lbl_73
        end
      end
      L8_1 = addRelatedProcess
      L8_1()
      L8_1 = reportRelatedBmHits
      L8_1()
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
::lbl_73::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

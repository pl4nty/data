local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    end
  end
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if 3 < L1_1 then
    L1_1 = contains
    L2_1 = L0_1
    L3_1 = {}
    L4_1 = "transfer"
    L5_1 = "addfile"
    L3_1[1] = L4_1
    L3_1[2] = L5_1
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = contains
      L2_1 = L0_1
      L3_1 = "\\share$\\"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = contains
        L2_1 = L0_1
        L3_1 = "\\admin$\\"
        L1_1 = L1_1(L2_1, L3_1)
        if not L1_1 then
          L1_1 = contains
          L2_1 = L0_1
          L3_1 = " \\\\"
          L1_1 = L1_1(L2_1, L3_1)
          if not L1_1 then
            L1_1 = contains
            L2_1 = L0_1
            L3_1 = " \"\"\\\\"
            L1_1 = L1_1(L2_1, L3_1)
            if not L1_1 then
              goto lbl_96
            end
          end
        end
      end
      L1_1 = pcall
      L2_1 = reportBmInfo
      L1_1, L2_1 = L1_1(L2_1)
      if not L1_1 and L2_1 then
        L3_1 = bm
        L3_1 = L3_1.add_related_string
        L4_1 = "bmInfoFailReason"
        L5_1 = tostring
        L6_1 = L2_1
        L5_1 = L5_1(L6_1)
        L6_1 = bm
        L6_1 = L6_1.RelatedStringBMReport
        L3_1(L4_1, L5_1, L6_1)
      end
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
::lbl_96::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

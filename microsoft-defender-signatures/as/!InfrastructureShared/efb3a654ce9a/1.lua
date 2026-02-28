local L0_1, L1_1, L2_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= "" then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[1]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[1]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_29::
L1_1 = IsExcludedByCmdlineMacOS
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.utf8p2
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = IsExcludedByImagePathMacOS
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_46
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_46::
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L0_1 = L1_1.utf8p1
L1_1 = sysio
L1_1 = L1_1.IsFileExists
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = bm
  L1_1 = L1_1.add_threat_file
  L2_1 = L0_1
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

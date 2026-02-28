local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[3]
        L0_1 = L0_1.utf8p2
        if L0_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_29::
L0_1 = string
L0_1 = L0_1.lower
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p2
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "/library/application support/lemon/lemon"
L4_1 = 0
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "lemon.app/contents/library/loginitems/lemon"
  L4_1 = 0
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    goto lbl_56
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_56::
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1070.002"
L4_1 = "ClearSystemLogs"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

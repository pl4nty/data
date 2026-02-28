local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
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
        L0_1 = L0_1[2]
        L0_1 = L0_1.utf8p2
        if L0_1 ~= nil then
          L0_1 = this_sigattrlog
          L0_1 = L0_1[2]
          L0_1 = L0_1.utf8p2
          if L0_1 ~= "" then
            goto lbl_34
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_34::
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p2
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.utf8p1
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "[^/]*$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L0_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    goto lbl_55
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_55::
L3_1 = bm
L3_1 = L3_1.trigger_sig
L4_1 = "BM_MacCurlFileDownload"
L5_1 = L1_1
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 12) then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1
    L4_1 = -12
    L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == "\\taskmgr.exe" then
      goto lbl_22
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_22::
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1003.001"
L4_1 = "credentialdumping_concrete"
L5_1 = 86400
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 15) then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -12
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == "\\spoolsv.exe" then
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
L3_1 = "tt_remediate"
L4_1 = "priteshell_malware"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1

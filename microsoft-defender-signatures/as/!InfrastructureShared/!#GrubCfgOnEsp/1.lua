local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = "MpUefiGrubCheck"
L1_1 = "MpUefiGrubCfg"
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L3_1 = #L2_1
  if not (L3_1 < 8) then
    goto lbl_21
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L4_1 = L2_1
L3_1 = L2_1.sub
L5_1 = -8
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == "grub.cfg" then
  L3_1 = MpCommon
  L3_1 = L3_1.AppendPersistContextNoPath
  L4_1 = L0_1
  L5_1 = L1_1
  L6_1 = 60
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = "\\windows\\system32\\hkcmd.db"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L3_1 = L0_1
  L2_1 = L0_1.find
  L4_1 = "\\windows\\system32\\fcache"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "fcache%d%d.db"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      goto lbl_52
    end
  end
  L3_1 = L0_1
  L2_1 = L0_1.find
  L4_1 = "\\windows\\system32\\speech\\speech"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    goto lbl_59
  end
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "speech%d%d.db"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    goto lbl_59
  end
end
::lbl_52::
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "MpNonPIIFileType"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_59::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

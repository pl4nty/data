local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[13]
if L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[13]
  L1_1 = L1_1.utf8p1
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    goto lbl_15
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_15::
L0_1 = {}
L0_1["4fc75186-2d08-4463-8273-286762239d76"] = true
L0_1["d96c3b4f-2fab-47bc-b290-b77181ab7096"] = true
L0_1["e19b7e59-ec56-4f6f-abe9-4b33f7ee7c69"] = true
L1_1 = versioning
L1_1 = L1_1.GetOrgID
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L2_1 = L0_1[L2_1]
  if L2_1 then
    goto lbl_37
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_37::
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.IsKnownFriendlyFile
  L4_1 = L2_1
  L5_1 = true
  L6_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 then
    goto lbl_56
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_56::
L3_1 = safeJsonSerialize
L4_1 = {}
L4_1.Process = L2_1
L5_1 = this_sigattrlog
L5_1 = L5_1[13]
L5_1 = L5_1.utf8p1
L4_1.DLL = L5_1
L3_1 = L3_1(L4_1)
L4_1 = bm
L4_1 = L4_1.add_related_file
L5_1 = this_sigattrlog
L5_1 = L5_1[13]
L5_1 = L5_1.utf8p1
L4_1(L5_1)
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "PotentialSideload_Metadata"
L6_1 = L3_1
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = bm
L4_1 = L4_1.set_detection_string
L5_1 = L3_1
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1

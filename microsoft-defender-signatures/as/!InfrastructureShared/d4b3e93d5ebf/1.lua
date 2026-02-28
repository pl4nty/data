local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L0_1.imagePath = L2_1
L2_1 = MpCommon
L2_1 = L2_1.IsFriendlyProcess
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
L0_1.friendly = L2_1
L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1 = L2_1()
L0_1.process_relationships = L2_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  L0_1.BCDPath = L2_1
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  L0_1.p2Data = L2_1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    L0_1.BCDPath = L2_1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L0_1.p2Data = L2_1
  end
end
L2_1 = bm
L2_1 = L2_1.add_related_file
L3_1 = L0_1.BCDPath
L2_1(L3_1)
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "ChangeFileData"
L4_1 = safeJsonSerialize
L5_1 = L0_1
L4_1 = L4_1(L5_1)
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1

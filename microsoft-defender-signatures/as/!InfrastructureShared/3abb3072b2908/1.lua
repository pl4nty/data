local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[7]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[11]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L0_1 = L1_1.utf8p1
end
L1_1 = this_sigattrlog
L1_1 = L1_1[12]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[12]
  L0_1 = L1_1.utf8p1
end
L1_1 = bm
L1_1 = L1_1.add_related_file
L2_1 = L0_1
L1_1(L2_1)
L1_1 = {}
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L1_1.image_path = L0_1
L3_1 = MpCommon
L3_1 = L3_1.IsFriendlyProcess
L4_1 = L2_1.ppid
L3_1 = L3_1(L4_1)
L1_1.friendly = L3_1
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
L1_1.children = L4_1
L1_1.parents = L3_1
L3_1 = getCurrentProcessInjectors
L3_1, L4_1, L5_1 = L3_1()
L1_1.injected = L5_1
L1_1.injectors = L4_1
L1_1.injection_relationship = L3_1
L3_1 = safeJsonSerialize
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "TelemetryData"
L5_1 = L1_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = versioning
L3_1 = L3_1.IsSeville
L3_1 = L3_1()
if L3_1 then
  L3_1 = L1_1.friendly
  if not L3_1 then
    L3_1 = bm
    L3_1 = L3_1.trigger_sig
    L4_1 = "UEFILogo.D"
    L5_1 = L1_1
    L3_1(L4_1, L5_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1

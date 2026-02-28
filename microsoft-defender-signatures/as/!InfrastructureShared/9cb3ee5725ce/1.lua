local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
if L1_1 ~= "" and L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "//[^%s]+%s([^%s]+)%s"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= "" and L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L2_1
    L5_1 = "/%.[^/]+$"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = TrackPidAndTechniqueBM
      L4_1 = "BM"
      L5_1 = "T1564.005"
      L6_1 = "DefenseEvasion_HideArtifacts_HiddenFileSystem_HiddenMount"
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = reportRelatedBmHits
      L3_1()
      L3_1 = addRelatedProcess
      L3_1()
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

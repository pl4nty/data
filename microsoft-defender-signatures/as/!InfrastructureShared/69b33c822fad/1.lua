local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[2]
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L0_1 = L1_1[3]
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L0_1 = L1_1[4]
    else
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = {}
L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1, L3_1 = L2_1()
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = mp
  L9_1 = L9_1.bitand
  L10_1 = L8_1.reason_ex
  L11_1 = 1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 == 1 then
    L9_1 = IsTacticObservedForPid
    L10_1 = L8_1.ppid
    L11_1 = "webserver_childproc"
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 then
      L9_1 = L8_1.image_path
      if L9_1 == nil then
        L9_1 = "none"
      end
      L10_1 = L8_1.cmd_line
      if L10_1 == nil then
        L10_1 = "none"
      end
      L11_1 = table
      L11_1 = L11_1.insert
      L12_1 = L1_1
      L13_1 = L9_1
      L14_1 = "_"
      L15_1 = L10_1
      L13_1 = L13_1 .. L14_1 .. L15_1
      L11_1(L12_1, L13_1)
      L11_1 = TrackPidAndTechniqueBM
      L12_1 = L0_1.ppid
      L13_1 = "T1190"
      L14_1 = "webserver_childproc"
      L15_1 = 7200
      L11_1(L12_1, L13_1, L14_1, L15_1)
    end
  end
end
L4_1 = IsTacticObservedForPid
L5_1 = L0_1.ppid
L6_1 = "webserver_childproc"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = bm
  L4_1 = L4_1.get_current_process_startup_info
  L4_1 = L4_1()
  if L4_1 ~= nil then
    L5_1 = L4_1.command_line
    if L5_1 ~= nil then
      L5_1 = table
      L5_1 = L5_1.insert
      L6_1 = L1_1
      L7_1 = "self_"
      L8_1 = L4_1.command_line
      L7_1 = L7_1 .. L8_1
      L5_1(L6_1, L7_1)
    end
  end
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "file_metadata"
  L7_1 = L1_1
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = addRelatedProcess
  L5_1()
  L5_1 = reportRelatedBmHits
  L5_1()
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

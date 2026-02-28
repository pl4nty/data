local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p1
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.add_related_file
L2_1 = L0_1
L1_1(L2_1)
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_28
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_28::
L2_1 = L1_1.ppid
L4_1 = L0_1
L3_1 = L0_1.match
L5_1 = "[^>](.-)([^\\/]-%.?([^%.\\/]*))$"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
if L4_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = isTainted
L7_1 = L0_1
L8_1 = "remote_file_created_taint"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = checkFilePathInProcessCommandline
  L7_1 = L2_1
  L8_1 = L4_1
  L9_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 then
    L6_1 = reportRelatedBmHits
    L6_1()
    L6_1 = addRelatedProcess
    L6_1()
    L6_1 = TrackPidAndTechniqueBM
    L7_1 = "BM"
    L8_1 = "T1486"
    L9_1 = "Impact_GpgEncryption"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = string
L6_1 = L6_1.sub
L7_1 = L0_1
L8_1 = 0
L9_1 = 5
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 ~= "/tmp/" then
  L6_1 = string
  L6_1 = L6_1.sub
  L7_1 = L0_1
  L8_1 = 0
  L9_1 = 9
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if L6_1 ~= "/var/tmp/" then
    L6_1 = string
    L6_1 = L6_1.sub
    L7_1 = L0_1
    L8_1 = 0
    L9_1 = 9
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    if L6_1 ~= "/dev/shm/" then
      goto lbl_105
    end
  end
end
L6_1 = checkFilePathInProcessCommandline
L7_1 = L2_1
L8_1 = L4_1
L9_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 then
  L6_1 = reportRelatedBmHits
  L6_1()
  L6_1 = addRelatedProcess
  L6_1()
  L6_1 = TrackPidAndTechniqueBM
  L7_1 = "BM"
  L8_1 = "T1486"
  L9_1 = "Impact_GpgEncryption"
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_105::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1

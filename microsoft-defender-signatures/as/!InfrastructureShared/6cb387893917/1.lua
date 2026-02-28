local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 ~= nil and L1_1 ~= "" and L0_1 ~= nil then
  L2_1 = L0_1.command_line
  if L2_1 ~= nil then
    goto lbl_19
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_19::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "/bin/tar"
L5_1 = -8
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = 0
  L3_1 = string
  L3_1 = L3_1.gmatch
  L4_1 = L0_1.command_line
  L5_1 = "/var/log/recap"
  L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
  for L6_1 in L3_1, L4_1, L5_1 do
    L2_1 = L2_1 + 1
  end
  if 15 < L2_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  L2_2 = ".db[^/%w]"
  L3_2 = ".sql[^/%w]"
  L4_2 = ".key[^/%w]"
  L5_2 = ".conf[^/%w]"
  L6_2 = ".doc?[^/%w]"
  L7_2 = ".pdf[^/%w]"
  L8_2 = ".xls?[^/%w]"
  L9_2 = ".ppt?[^/%w]"
  L10_2 = ".sh[^/%w]"
  L11_2 = ".c[^/%w]"
  L12_2 = ".cpp[^/%w]"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L1_2[9] = L10_2
  L1_2[10] = L11_2
  L1_2[11] = L12_2
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = 0
    L8_2 = string
    L8_2 = L8_2.gmatch
    L9_2 = A0_2
    L10_2 = L6_2
    L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2)
    for L11_2 in L8_2, L9_2, L10_2 do
      L7_2 = L7_2 + 1
    end
    if 15 < L7_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end

CheckCriticalFilesArchived = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "/bin/zip"
L5_1 = -8
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "/bin/tar"
  L5_1 = -8
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "/bin/gzip"
    L5_1 = -9
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "/7z"
      L5_1 = -3
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "/usr/bin/file-roller"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 ~= 1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "/7zz"
          L5_1 = -4
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            goto lbl_116
          end
        end
      end
    end
  end
end
L2_1 = CheckCriticalFilesArchived
L3_1 = L0_1.command_line
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = addRelatedProcess
  L2_1()
  L2_1 = reportRelatedBmHits
  L2_1()
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = "BM"
  L4_1 = "T1560"
  L5_1 = "Collection_ArchiveData"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_116::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

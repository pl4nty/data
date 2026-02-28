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
            goto lbl_111
          end
        end
      end
    end
  end
end
L2_1 = addRelatedProcess
L2_1()
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1059"
L5_1 = "SuspiciousCommandline"
L2_1(L3_1, L4_1, L5_1)
L2_1 = RemediateProcessTreeForLinux
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_111::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

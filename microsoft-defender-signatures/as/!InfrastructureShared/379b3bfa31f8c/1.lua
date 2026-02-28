local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 150000000
L3_1 = bm
L3_1 = L3_1.GetSignatureMatchDuration
L3_1 = L3_1()
if L2_1 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = 0
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  if L9_1 == 16388 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L8_1]
    L10_1 = L10_1.utf8p1
    if L10_1 ~= nil and L10_1 ~= "" then
      L11_1 = L1_1[L10_1]
      if L11_1 == nil then
        L11_1 = isSensitiveFileForLinux
        L12_1 = L10_1
        L11_1 = L11_1(L12_1)
        if L11_1 then
          L1_1[L10_1] = true
          L11_1 = bm
          L11_1 = L11_1.add_related_file
          L12_1 = L10_1
          L11_1(L12_1)
          L4_1 = L4_1 + 1
        end
      end
    end
  end
end
if 10 <= L4_1 then
  L5_1 = bm
  L5_1 = L5_1.get_current_process_startup_info
  L5_1 = L5_1()
  if L5_1 ~= nil then
    L6_1 = L5_1.ppid
    if L6_1 ~= nil then
      L6_1 = IsDetectionThresholdMetLinux
      L7_1 = L5_1.ppid
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L6_1 = addRelatedProcess
        L6_1()
        L6_1 = reportRelatedBmHits
        L6_1()
        L6_1 = RemediateProcessTreeForLinux
        L6_1()
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
  L6_1 = TrackPidAndTechniqueBM
  L7_1 = "BM"
  L8_1 = "T1083"
  L9_1 = "Discovery_SensitiveFilesOpen"
  L6_1(L7_1, L8_1, L9_1)
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

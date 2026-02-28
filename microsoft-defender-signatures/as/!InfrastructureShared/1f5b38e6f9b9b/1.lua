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
  if L9_1 == 16387 then
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
  L5_1 = addRelatedProcess
  L5_1()
  L5_1 = reportRelatedBmHits
  L5_1()
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = "BM"
  L7_1 = "T1486"
  L8_1 = "Impact_SensitiveFileTampering"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = safeJsonSerialize
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "file_metadata"
  L8_1 = L5_1
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = RemediateProcessTreeForLinux
  L6_1()
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

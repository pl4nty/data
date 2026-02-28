local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = 0
L3_1 = 150000000
L4_1 = bm
L4_1 = L4_1.GetSignatureMatchDuration
L4_1 = L4_1()
if L3_1 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsProcessExcludedFromRansomwareAnalysis
L4_1 = L4_1()
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = 1
L5_1 = L0_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = sigattr_tail
  L8_1 = L8_1[L7_1]
  L8_1 = L8_1.attribute
  if L8_1 == 16385 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L7_1]
    L9_1 = L9_1.utf8p1
    if L9_1 ~= nil then
      L9_1 = sigattr_tail
      L9_1 = L9_1[L7_1]
      L9_1 = L9_1.utf8p1
      L10_1 = L1_1[L9_1]
      if L10_1 == nil then
        L1_1[L9_1] = true
        L10_1 = bm
        L10_1 = L10_1.add_related_file
        L11_1 = L9_1
        L10_1(L11_1)
        L11_1 = L9_1
        L10_1 = L9_1.match
        L12_1 = "%.[^/%.]+$"
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 == ".cpt" then
          L2_1 = L2_1 + 1
        end
      end
    end
  end
end
if 10 <= L2_1 then
  L4_1 = addRelatedProcess
  L4_1()
  L4_1 = reportRelatedBmHits
  L4_1()
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = "BM"
  L6_1 = "T1486"
  L7_1 = "Impact_CcryptEncryption"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

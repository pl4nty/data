local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = {}
L2_1 = {}
L3_1 = 0
L4_1 = 150000000
L5_1 = bm
L5_1 = L5_1.GetSignatureMatchDuration
L5_1 = L5_1()
if L4_1 < L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  if L9_1 == 16385 then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L8_1]
    L10_1 = L10_1.utf8p1
    if L10_1 ~= nil then
      L10_1 = sigattr_tail
      L10_1 = L10_1[L8_1]
      L10_1 = L10_1.utf8p1
      L11_1 = L2_1[L10_1]
      if L11_1 == nil then
        L2_1[L10_1] = true
        L11_1 = bm
        L11_1 = L11_1.add_related_file
        L12_1 = L10_1
        L11_1(L12_1)
        L12_1 = L10_1
        L11_1 = L10_1.match
        L13_1 = "%.[^/%.]+$"
        L11_1 = L11_1(L12_1, L13_1)
        if L11_1 ~= nil then
          L12_1 = L1_1[L11_1]
          if L12_1 == nil then
            L3_1 = L3_1 + 1
            L1_1[L11_1] = 1
          else
            L12_1 = L1_1[L11_1]
            L12_1 = L12_1 + 1
            L1_1[L11_1] = L12_1
          end
        end
      end
    end
  end
end
L5_1 = 0
L6_1 = pairs
L7_1 = L1_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  if L10_1 > L5_1 then
    L5_1 = L10_1
  end
end
if L3_1 < 3 and 5 <= L5_1 then
  L6_1 = addRelatedProcess
  L6_1()
  L6_1 = reportRelatedBmHits
  L6_1()
  L6_1 = TrackPidAndTechniqueBM
  L7_1 = "BM"
  L8_1 = "T1486"
  L9_1 = "Impact_CcryptEncryption"
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = RemediateProcessTreeForLinux
  L6_1()
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1

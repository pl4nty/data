local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "RPF:GoLang:pclntab_magic_unknown"
L0_1 = L0_1(L1_1)
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = 4294967280
L3_1 = 4294967291
L4_1 = 4294967290
L5_1 = 4294967281
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.bitand
  L8_1 = L0_1
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= L6_1 then
    L7_1 = pcall
    L8_1 = mp
    L8_1 = L8_1.get_contextdata
    L9_1 = mp
    L9_1 = L9_1.CONTEXT_DATA_FILEPATH
    L7_1, L8_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L9_1 = isnull
      L10_1 = L8_1
      L9_1 = L9_1(L10_1)
      if not L9_1 then
        L9_1 = MpCommon
        L9_1 = L9_1.PathToWin32Path
        L10_1 = L8_1
        L9_1 = L9_1(L10_1)
        L10_1 = isnull
        L11_1 = L9_1
        L10_1 = L10_1(L11_1)
        if L10_1 then
          L10_1 = mp
          L10_1 = L10_1.CLEAN
          return L10_1
        end
        L10_1 = string
        L10_1 = L10_1.lower
        L11_1 = L9_1
        L10_1 = L10_1(L11_1)
        L9_1 = L10_1
        L10_1 = {}
        L11_1 = "^%a:\\program files\\"
        L12_1 = "^%a:\\program files %(x86%)\\"
        L13_1 = "^%a:\\programdata\\microsoft\\"
        L14_1 = "^%a:\\windows\\system32\\"
        L15_1 = "^%a:\\windows\\syswow64\\"
        L16_1 = "^%a:\\windows\\winsxs\\"
        L10_1[1] = L11_1
        L10_1[2] = L12_1
        L10_1[3] = L13_1
        L10_1[4] = L14_1
        L10_1[5] = L15_1
        L10_1[6] = L16_1
        L11_1 = false
        L12_1 = ipairs
        L13_1 = L10_1
        L12_1, L13_1, L14_1 = L12_1(L13_1)
        for L15_1, L16_1 in L12_1, L13_1, L14_1 do
          L17_1 = string
          L17_1 = L17_1.find
          L18_1 = L9_1
          L19_1 = L16_1
          L17_1 = L17_1(L18_1, L19_1)
          if L17_1 then
            L11_1 = true
            break
          end
        end
        if not L11_1 then
          L12_1 = mp
          L12_1 = L12_1.IsTrustedFile
          L13_1 = false
          L12_1 = L12_1(L13_1)
          if L12_1 == true then
            L12_1 = mp
            L12_1 = L12_1.CLEAN
            return L12_1
          end
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

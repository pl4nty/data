local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.IOAVGetDownloadUrl
L0_1, L1_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattributevalue
    L3_1 = "RPF:GoLang:pclntab_magic_unknown"
    L2_1 = L2_1(L3_1)
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = {}
    L4_1 = 4294967280
    L5_1 = 4294967291
    L6_1 = 4294967290
    L7_1 = 4294967281
    L3_1[1] = L4_1
    L3_1[2] = L5_1
    L3_1[3] = L6_1
    L3_1[4] = L7_1
    L4_1 = false
    L5_1 = ipairs
    L6_1 = L3_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = mp
      L10_1 = L10_1.bitand
      L11_1 = L2_1
      L12_1 = L9_1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 ~= L9_1 then
        L4_1 = true
        break
      end
    end
    if L4_1 then
      L5_1 = {}
      L5_1.SIG_CONTEXT = "GoLang"
      L5_1.CONTENT_SOURCE = "IOA_GOLANG_64_WITH_TAMPERED_PCLNTAB_MAGIC"
      L6_1 = mp
      L6_1 = L6_1.CheckUrl
      L7_1 = L1_1
      L6_1, L7_1 = L6_1(L7_1)
      if L6_1 == 1 and L7_1 == 1 then
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
      L8_1 = SafeGetUrlReputation
      L9_1 = {}
      L10_1 = L1_1
      L9_1[1] = L10_1
      L10_1 = L5_1
      L11_1 = false
      L12_1 = 3000
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      L9_1 = L8_1.urls
      L9_1 = L9_1[L1_1]
      if L9_1 then
        L9_1 = L8_1.urls
        L9_1 = L9_1[L1_1]
        L9_1 = L9_1.determination
        if L9_1 ~= 1 then
          L9_1 = L8_1.urls
          L9_1 = L9_1[L1_1]
          L9_1 = L9_1.confidence
          if L9_1 ~= 90 then
            L9_1 = mp
            L9_1 = L9_1.IsTrustedFile
            L10_1 = false
            L9_1 = L9_1(L10_1)
            if L9_1 == true then
              L9_1 = mp
              L9_1 = L9_1.CLEAN
              return L9_1
            end
            L9_1 = mp
            L9_1 = L9_1.INFECTED
            return L9_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

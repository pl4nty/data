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
L2_1 = false
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.bitand
  L9_1 = L0_1
  L10_1 = L7_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= L7_1 then
    L2_1 = true
    break
  end
end
if L2_1 then
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
  L3_1 = L3_1(L4_1)
  L4_1 = isnull
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.GetProcessCommandLine
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L5_1 = isnull
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  
  function L5_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L1_2 = {}
    L2_2 = string
    L2_2 = L2_2.gmatch
    L3_2 = A0_2
    L4_2 = "http[s]?://[^\"%s]+"
    L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
    for L5_2 in L2_2, L3_2, L4_2 do
      L6_2 = table
      L6_2 = L6_2.insert
      L7_2 = L1_2
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
    end
    return L1_2
  end
  
  L6_1 = L5_1
  L7_1 = L4_1
  L6_1 = L6_1(L7_1)
  L7_1 = table_dedup
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
  L7_1 = {}
  L7_1.SIG_CONTEXT = "GoLang"
  L7_1.CONTENT_SOURCE = "GOLANG_64_WITH_TEMPERED_PCLNTAB_MAGIC"
  L8_1 = ipairs
  L9_1 = L6_1
  L8_1, L9_1, L10_1 = L8_1(L9_1)
  for L11_1, L12_1 in L8_1, L9_1, L10_1 do
    L13_1 = string
    L13_1 = L13_1.match
    L14_1 = L12_1
    L15_1 = "^https?://"
    L13_1 = L13_1(L14_1, L15_1)
    if L13_1 then
      L13_1 = mp
      L13_1 = L13_1.CheckUrl
      L14_1 = L12_1
      L13_1, L14_1 = L13_1(L14_1)
      if L13_1 == 1 and L14_1 == 1 then
        L15_1 = mp
        L15_1 = L15_1.CLEAN
        return L15_1
      end
      L15_1 = SafeGetUrlReputation
      L16_1 = {}
      L17_1 = L12_1
      L16_1[1] = L17_1
      L17_1 = L7_1
      L18_1 = false
      L19_1 = 3000
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      L16_1 = L15_1.urls
      L16_1 = L16_1[L12_1]
      if L16_1 then
        L16_1 = L15_1.urls
        L16_1 = L16_1[L12_1]
        L16_1 = L16_1.determination
        if L16_1 ~= 1 then
          L16_1 = L15_1.urls
          L16_1 = L16_1[L12_1]
          L16_1 = L16_1.confidence
          if L16_1 ~= 90 then
            L16_1 = mp
            L16_1 = L16_1.IsTrustedFile
            L17_1 = false
            L16_1 = L16_1(L17_1)
            if L16_1 == true then
              L16_1 = mp
              L16_1 = L16_1.CLEAN
              return L16_1
            end
            L16_1 = mp
            L16_1 = L16_1.INFECTED
            return L16_1
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

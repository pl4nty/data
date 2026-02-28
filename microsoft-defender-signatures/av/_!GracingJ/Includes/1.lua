local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
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
        L11_1 = "\\users\\.+"
        L12_1 = "\\windows\\.+"
        L13_1 = "\\device\\.+"
        L14_1 = "\\temp\\.+"
        L10_1[1] = L11_1
        L10_1[2] = L12_1
        L10_1[3] = L13_1
        L10_1[4] = L14_1
        L11_1 = ipairs
        L12_1 = L10_1
        L11_1, L12_1, L13_1 = L11_1(L12_1)
        for L14_1, L15_1 in L11_1, L12_1, L13_1 do
          L16_1 = string
          L16_1 = L16_1.find
          L17_1 = L9_1
          L18_1 = L15_1
          L16_1 = L16_1(L17_1, L18_1)
          if L16_1 then
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
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

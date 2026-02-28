local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
L1_1 = L0_1.match_offset
if L1_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.match_offset
L1_1 = L1_1 + 1
L2_1 = 128
L3_1 = ""
L4_1 = L0_1.is_header
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.readheader
  L5_1 = L1_1
  L6_1 = L1_1 + L2_1
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
else
  L4_1 = mp
  L4_1 = L4_1.readfooter
  L5_1 = L1_1
  L6_1 = L1_1 + L2_1
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
end
if L3_1 ~= "" then
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = ">"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= nil then
    L6_1 = L3_1
    L5_1 = L3_1.sub
    L7_1 = L4_1 + 1
    L8_1 = L2_1 - 1
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L6_1 = L3_1
    L5_1 = L3_1.find
    L7_1 = "<"
    L8_1 = 1
    L9_1 = true
    L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L6_1 ~= nil then
      L8_1 = L3_1
      L7_1 = L3_1.sub
      L9_1 = 1
      L10_1 = L6_1 - 1
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 == nil then
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
      L8_1 = MpCommon
      L8_1 = L8_1.Base64Encode
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      L9_1 = set_research_data
      L10_1 = "OFFCM:"
      L11_1 = L8_1
      L12_1 = false
      L9_1(L10_1, L11_1, L12_1)
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

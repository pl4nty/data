local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "->(PdfUriList)"
L4_1 = -15
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = split
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L3_1 = "\r\n"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = {}
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = MpCommon
  L8_1 = L8_1.StringRegExpSearch
  L9_1 = "^(?:(?:https?|ftp):\\/\\/)?[\\w\\-]+(?:\\.[\\w\\-]+)+"
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L7_1
  L10_1, L11_1, L12_1 = L10_1(L11_1)
  L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 == true then
    L10_1 = #L7_1
    if 5 < L10_1 then
      L10_1 = table
      L10_1 = L10_1.insert
      L11_1 = L2_1
      L12_1 = L7_1
      L10_1(L11_1, L12_1)
    end
  end
end
L3_1 = {}
L3_1.SIG_CONTEXT = "LuaGen"
L3_1.CONTENT_SOURCE = "PDF"
L3_1.FILELESS = "false"
L3_1.CMDLINE_URL = "false"
L3_1.BREAK_AT_FIRST_HIT_MALWARE = "60"
L3_1.BREAK_AT_FIRST_HIT_PHISH = "60"
L3_1.BREAK_AT_FIRST_HIT_CLEAN = "60"
L3_1.TAG = "Email"
L4_1 = CheckUrlReputationSimple
L5_1 = L2_1
L6_1 = L3_1
L7_1 = 60
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 == true then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

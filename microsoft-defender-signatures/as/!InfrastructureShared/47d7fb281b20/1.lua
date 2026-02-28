local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = "https?://[%w-_%.%?%.:/%+=&]+"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CheckUrl
L4_1 = L2_1
L3_1, L4_1 = L3_1(L4_1)
if L3_1 == 1 and L4_1 == 1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = table
L6_1 = L6_1.insert
L7_1 = L5_1
L8_1 = L2_1
L6_1(L7_1, L8_1)
L6_1 = {}
L6_1.SIG_CONTEXT = "CMD"
L6_1.CONTENT_SOURCE = "CURL"
L6_1.PROCESS_CONTEXT = "CURL.EXE"
L6_1.PARENT_CONTEXT = nil
L6_1.FILELESS = "false"
L6_1.CMDLINE_URL = "true"
L6_1.BREAK_AT_FIRST_HIT_MALWARE = "40"
L7_1 = mp
L7_1 = L7_1.GetUrlReputation
L8_1 = L5_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
if L7_1 ~= nil then
  L8_1 = L7_1.urls
  L9_1 = ipairs
  L10_1 = L8_1
  L9_1, L10_1, L11_1 = L9_1(L10_1)
  for L12_1, L13_1 in L9_1, L10_1, L11_1 do
    if L13_1 ~= nil then
      L14_1 = L13_1.determination
      if L14_1 ~= nil then
        L14_1 = L13_1.determination
        L15_1 = L13_1.confidence
        if L14_1 == 2 and 60 <= L15_1 then
          L16_1 = mp
          L16_1 = L16_1.INFECTED
          return L16_1
        elseif L14_1 == 1 then
          L16_1 = mp
          L16_1 = L16_1.CLEAN
          return L16_1
        elseif L14_1 == 4 and 10 <= L15_1 then
          L16_1 = mp
          L16_1 = L16_1.set_mpattribute
          L17_1 = "CMDHSTR:Win32/Suspilruc!unknown"
          L16_1(L17_1)
        else
          L16_1 = mp
          L16_1 = L16_1.set_mpattribute
          L17_1 = "CMDHSTR:Win32/Suspilruc!others"
          L16_1(L17_1)
        end
      end
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1

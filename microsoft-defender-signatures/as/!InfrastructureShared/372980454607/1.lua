local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_PATH
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "\\tasks"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "BM_XML_FILE"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "MpInternal_IsPliScan"
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "MpAlwaysLowfiMatch"
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = mp
        L1_1 = L1_1.GetBruteMatchData
        L1_1 = L1_1()
        L2_1 = L1_1.match_offset
        L2_1 = L2_1 + 1
        L3_1 = 128
        L4_1 = ""
        L5_1 = L1_1.is_header
        if L5_1 then
          L5_1 = tostring
          L6_1 = headerpage
          L5_1 = L5_1(L6_1)
          L6_1 = L5_1
          L5_1 = L5_1.sub
          L7_1 = L2_1
          L8_1 = L2_1 + L3_1
          L5_1 = L5_1(L6_1, L7_1, L8_1)
          L4_1 = L5_1
        else
          L5_1 = tostring
          L6_1 = footerpage
          L5_1 = L5_1(L6_1)
          L6_1 = L5_1
          L5_1 = L5_1.sub
          L7_1 = L2_1
          L8_1 = L2_1 + L3_1
          L5_1 = L5_1(L6_1, L7_1, L8_1)
          L4_1 = L5_1
        end
        L5_1 = string
        L5_1 = L5_1.match
        L6_1 = L4_1
        L7_1 = "ui.skype.com"
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 ~= nil then
          L5_1 = mp
          L5_1 = L5_1.CLEAN
          return L5_1
        end
        L6_1 = L4_1
        L5_1 = L4_1.find
        L7_1 = "http"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 ~= nil then
          L7_1 = L4_1
          L6_1 = L4_1.sub
          L8_1 = L5_1
          L9_1 = L3_1 - 1
          L6_1 = L6_1(L7_1, L8_1, L9_1)
          L4_1 = L6_1
          L7_1 = L4_1
          L6_1 = L4_1.find
          L8_1 = "<"
          L9_1 = 1
          L10_1 = true
          L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if L7_1 ~= nil then
            L9_1 = L4_1
            L8_1 = L4_1.sub
            L10_1 = 1
            L11_1 = L7_1 - 1
            L8_1 = L8_1(L9_1, L10_1, L11_1)
            L9_1 = MpCommon
            L9_1 = L9_1.Base64Encode
            L10_1 = L8_1
            L9_1 = L9_1(L10_1)
            L10_1 = set_research_data
            L11_1 = "taskIEUrl"
            L12_1 = L9_1
            L13_1 = false
            L10_1(L11_1, L12_1, L13_1)
            L10_1 = mp
            L10_1 = L10_1.INFECTED
            return L10_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

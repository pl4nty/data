local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "\\tasks"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "[^ ]+ +[^ ]+$"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "BM_XML_FILE"
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.get_mpattribute
      L3_1 = "MpInternal_IsPliScan"
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L2_1 = mp
        L2_1 = L2_1.get_mpattribute
        L3_1 = "MpAlwaysLowfiMatch"
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = mp
          L2_1 = L2_1.GetBruteMatchData
          L2_1 = L2_1()
          L3_1 = L2_1.match_offset
          L3_1 = L3_1 + 1
          L4_1 = 128
          L5_1 = ""
          L6_1 = L2_1.is_header
          if L6_1 then
            L6_1 = tostring
            L7_1 = headerpage
            L6_1 = L6_1(L7_1)
            L7_1 = L6_1
            L6_1 = L6_1.sub
            L8_1 = L3_1
            L9_1 = L3_1 + L4_1
            L6_1 = L6_1(L7_1, L8_1, L9_1)
            L5_1 = L6_1
          else
            L6_1 = tostring
            L7_1 = footerpage
            L6_1 = L6_1(L7_1)
            L7_1 = L6_1
            L6_1 = L6_1.sub
            L8_1 = L3_1
            L9_1 = L3_1 + L4_1
            L6_1 = L6_1(L7_1, L8_1, L9_1)
            L5_1 = L6_1
          end
          L6_1 = string
          L6_1 = L6_1.lower
          L7_1 = L5_1
          L6_1 = L6_1(L7_1)
          L7_1 = {}
          L8_1 = "youtube-dl%.exe"
          L9_1 = "ffmpeg%.exe"
          L10_1 = "curl%.exe"
          L11_1 = "vstoinstaller%.exe"
          L12_1 = "microsoft%.com"
          L13_1 = "/feedstation/"
          L14_1 = "=updateindex"
          L15_1 = "/iplog%.php%?"
          L16_1 = "/default%.aspx%?"
          L17_1 = "localhost"
          L18_1 = "%:[0-9]+/"
          L19_1 = "%.co%.kr"
          L20_1 = "%.cf/"
          L21_1 = "cleveraccounts%.com"
          L22_1 = "syncfx%.com"
          L23_1 = "pass-pdam%.com"
          L7_1[1] = L8_1
          L7_1[2] = L9_1
          L7_1[3] = L10_1
          L7_1[4] = L11_1
          L7_1[5] = L12_1
          L7_1[6] = L13_1
          L7_1[7] = L14_1
          L7_1[8] = L15_1
          L7_1[9] = L16_1
          L7_1[10] = L17_1
          L7_1[11] = L18_1
          L7_1[12] = L19_1
          L7_1[13] = L20_1
          L7_1[14] = L21_1
          L7_1[15] = L22_1
          L7_1[16] = L23_1
          L8_1 = #L7_1
          L9_1 = 1
          L10_1 = L8_1
          L11_1 = 1
          for L12_1 = L9_1, L10_1, L11_1 do
            L13_1 = string
            L13_1 = L13_1.match
            L14_1 = L6_1
            L15_1 = L7_1[L12_1]
            L13_1 = L13_1(L14_1, L15_1)
            if L13_1 ~= nil then
              L13_1 = mp
              L13_1 = L13_1.CLEAN
              return L13_1
            end
          end
          L10_1 = L5_1
          L9_1 = L5_1.find
          L11_1 = "http"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if L9_1 ~= nil then
            L11_1 = L5_1
            L10_1 = L5_1.sub
            L12_1 = L9_1
            L13_1 = L4_1 - 1
            L10_1 = L10_1(L11_1, L12_1, L13_1)
            L5_1 = L10_1
            L11_1 = L5_1
            L10_1 = L5_1.find
            L12_1 = "<"
            L13_1 = 1
            L14_1 = true
            L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
            if L11_1 ~= nil then
              L13_1 = L5_1
              L12_1 = L5_1.find
              L14_1 = " "
              L15_1 = 1
              L16_1 = true
              L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
              L14_1 = ""
              if L13_1 ~= nil and L11_1 > L13_1 then
                L16_1 = L5_1
                L15_1 = L5_1.sub
                L17_1 = 1
                L18_1 = L13_1 - 1
                L15_1 = L15_1(L16_1, L17_1, L18_1)
                L14_1 = L15_1
              else
                L16_1 = L5_1
                L15_1 = L5_1.sub
                L17_1 = 1
                L18_1 = L11_1 - 1
                L15_1 = L15_1(L16_1, L17_1, L18_1)
                L14_1 = L15_1
              end
              L15_1 = MpCommon
              L15_1 = L15_1.Base64Encode
              L16_1 = L14_1
              L15_1 = L15_1(L16_1)
              L16_1 = set_research_data
              L17_1 = "taskRenamedMsiUrl"
              L18_1 = L15_1
              L19_1 = false
              L16_1(L17_1, L18_1, L19_1)
              L16_1 = mp
              L16_1 = L16_1.INFECTED
              return L16_1
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

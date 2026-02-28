local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.SCANREASON_ONMODIFIEDHANDLECLOSE
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
    L0_1 = L0_1(L1_1)
    L1_1 = getCachePaths
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if L1_1 ~= nil then
      L2_1 = mp
      L2_1 = L2_1.getfilename
      L3_1 = mp
      L3_1 = L3_1.bitor
      L4_1 = mp
      L4_1 = L4_1.bitor
      L5_1 = mp
      L5_1 = L5_1.FILEPATH_QUERY_FNAME
      L6_1 = mp
      L6_1 = L6_1.FILEPATH_QUERY_PATH
      L4_1 = L4_1(L5_1, L6_1)
      L5_1 = mp
      L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
      L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L3_1(L4_1, L5_1)
      L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
      L4_1 = {}
      L4_1[".pdf"] = true
      L4_1[".doc"] = true
      L4_1[".xls"] = true
      L4_1[".rtf"] = true
      L4_1[".docm"] = true
      L4_1[".xlsm"] = true
      L4_1[".ppam"] = true
      L4_1[".pptm"] = true
      L4_1[".ppsm"] = true
      L4_1[".potm"] = true
      L4_1[".xlsx"] = true
      L4_1[".docx"] = true
      L4_1[".xlsb"] = true
      L4_1[".xltx"] = true
      L4_1[".xltm"] = true
      L4_1[".xlt"] = true
      L4_1[".xlam"] = true
      L4_1[".xla"] = true
      L4_1[".dotx"] = true
      L4_1[".dotm"] = true
      L4_1[".odt"] = true
      L4_1[".pptx"] = true
      L4_1[".pps"] = true
      L4_1[".ppsx"] = true
      L4_1[".jse"] = true
      L4_1[".vbs"] = true
      L4_1[".wsf"] = true
      L4_1[".vbe"] = true
      L4_1[".hta"] = true
      L4_1[".js"] = true
      L4_1[".mht"] = true
      L4_1[".lnk"] = true
      L4_1[".bat"] = true
      L4_1[".ps1"] = true
      L4_1[".zip"] = true
      L4_1[".rar"] = true
      L4_1[".7z"] = true
      L4_1[".iso"] = true
      L4_1[".arj"] = true
      L4_1[".gz"] = true
      L4_1[".ace"] = true
      L4_1[".img"] = true
      L4_1[".exe"] = true
      L4_1[".scr"] = true
      L4_1[".pif"] = true
      L4_1[".htm"] = true
      L4_1[".html"] = true
      L4_1[".jar"] = true
      L5_1 = nil
      L6_1 = nil
      L7_1 = nil
      L8_1 = pairs
      L9_1 = L1_1
      L8_1, L9_1, L10_1 = L8_1(L9_1)
      for L11_1, L12_1 in L8_1, L9_1, L10_1 do
        L14_1 = L2_1
        L13_1 = L2_1.find
        L15_1 = L12_1
        L16_1 = 1
        L17_1 = true
        L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
        if L13_1 ~= nil then
          L13_1 = string
          L13_1 = L13_1.sub
          L14_1 = L3_1
          L15_1 = -3
          L13_1 = L13_1(L14_1, L15_1)
          L5_1 = L13_1
          L13_1 = string
          L13_1 = L13_1.sub
          L14_1 = L3_1
          L15_1 = -4
          L13_1 = L13_1(L14_1, L15_1)
          L6_1 = L13_1
          L13_1 = string
          L13_1 = L13_1.sub
          L14_1 = L3_1
          L15_1 = -5
          L13_1 = L13_1(L14_1, L15_1)
          L7_1 = L13_1
          L13_1 = L4_1[L5_1]
          if L13_1 ~= true then
            L13_1 = L4_1[L6_1]
            if L13_1 ~= true then
              L13_1 = L4_1[L7_1]
              if L13_1 ~= true then
                goto lbl_159
              end
            end
          end
          L13_1 = MpCommon
          L13_1 = L13_1.AppendPersistContextNoPath
          L14_1 = "CLF_AM"
          L15_1 = "CLF_AM_EC"
          L16_1 = 60
          L13_1(L14_1, L15_1, L16_1)
          L14_1 = L2_1
          L13_1 = L2_1.sub
          L15_1 = 1
          L16_1 = 8
          L13_1 = L13_1(L14_1, L15_1, L16_1)
          if L13_1 == "\\device\\" then
            L13_1 = MpCommon
            L13_1 = L13_1.PathToWin32Path
            L14_1 = L2_1
            L13_1 = L13_1(L14_1)
            L2_1 = L13_1
          end
          L13_1 = MpCommon
          L13_1 = L13_1.AppendPersistContextNoPath
          L14_1 = "CLF_IC"
          L15_1 = L2_1
          L16_1 = "\\"
          L17_1 = L3_1
          L15_1 = L15_1 .. L16_1 .. L17_1
          L16_1 = 60
          L13_1(L14_1, L15_1, L16_1)
          L13_1 = mp
          L13_1 = L13_1.INFECTED
          return L13_1
        end
        ::lbl_159::
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

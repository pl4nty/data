local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILE_AGE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil and L0_1 <= 7200 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSDEVICEPATH
L2_1 = L2_1(L3_1)
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1
L5_1 = "\\"
L6_1 = L1_1
L3_1 = L4_1 .. L5_1 .. L6_1
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L3_1
L6_1 = "BM_RoxstageProcessEval"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L3_1
L6_1 = "BM_RoxstageProcessBlock"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L4_1[".pdf"] = true
L4_1[".doc"] = true
L4_1[".docx"] = true
L4_1[".docm"] = true
L4_1[".xls"] = true
L4_1[".xlsx"] = true
L4_1[".xlsm"] = true
L4_1[".ppt"] = true
L4_1[".pptx"] = true
L4_1[".pptm"] = true
L5_1 = {}
L5_1[".txt"] = true
L5_1[".bat"] = true
L5_1[".cmd"] = true
L5_1[".ps1"] = true
L5_1[".vbs"] = true
L5_1[".wsf"] = true
L5_1[".js"] = true
L5_1[".html"] = true
L5_1[".htm"] = true
L5_1[".hta"] = true
L5_1[".xml"] = true
L6_1 = {}
L6_1[".zip"] = true
L6_1[".rar"] = true
L6_1[".7z"] = true
L6_1[".gzip"] = true
L7_1 = {}
L7_1[".jpeg"] = true
L7_1[".jpg"] = true
L7_1[".jpe"] = true
L7_1[".png"] = true
L7_1[".bmp"] = true
L8_1 = {}
L8_1[".webm"] = true
L8_1[".mkv"] = true
L8_1[".flv"] = true
L8_1[".vob"] = true
L8_1[".ogv"] = true
L8_1[".ogg"] = true
L8_1[".drc"] = true
L8_1[".gif"] = true
L8_1[".gifv"] = true
L8_1[".mng"] = true
L8_1[".avi"] = true
L8_1[".mts"] = true
L8_1[".m2ts"] = true
L8_1[".ts"] = true
L8_1[".mov"] = true
L8_1[".qt"] = true
L8_1[".wmv"] = true
L8_1[".yuv"] = true
L8_1[".rm"] = true
L8_1[".rmvb"] = true
L8_1[".asf"] = true
L8_1[".amv"] = true
L8_1[".mp4"] = true
L8_1[".m4p"] = true
L8_1[".m4v"] = true
L8_1[".mpg"] = true
L8_1[".mpeg"] = true
L8_1[".mp2"] = true
L8_1[".mpe"] = true
L8_1[".mpv"] = true
L8_1[".m2v"] = true
L8_1[".f4v"] = true
L8_1[".f4p"] = true
L8_1[".f4a"] = true
L8_1[".f4b"] = true
L9_1 = {}
L9_1[".3gp"] = true
L9_1[".aa"] = true
L9_1[".aac"] = true
L9_1[".aax"] = true
L9_1[".act"] = true
L9_1[".aiff"] = true
L9_1[".alac"] = true
L9_1[".amr"] = true
L9_1[".ape"] = true
L9_1[".au"] = true
L9_1[".awb"] = true
L9_1[".dct"] = true
L9_1[".dss"] = true
L9_1[".dvf"] = true
L9_1[".flac"] = true
L9_1[".gsm"] = true
L9_1[".iklax"] = true
L9_1[".ivs"] = true
L9_1[".m4a"] = true
L9_1[".m4b"] = true
L9_1[".m4p"] = true
L9_1[".mmf"] = true
L9_1[".mp3"] = true
L9_1[".mpc"] = true
L9_1[".msv"] = true
L9_1[".nmf "] = true
L9_1[".nsf"] = true
L9_1[".ogg"] = true
L9_1[".oga"] = true
L9_1[".mogg"] = true
L9_1[".opus"] = true
L9_1[".ra"] = true
L9_1[".rm"] = true
L9_1[".raw"] = true
L9_1[".sln"] = true
L9_1[".tta"] = true
L9_1[".voc"] = true
L9_1[".vox"] = true
L9_1[".wav"] = true
L9_1[".wma"] = true
L9_1[".wv"] = true
L9_1[".8svx"] = true
L10_1 = {}
L10_1[".lnk"] = true
L10_1[".rtf"] = true
L11_1 = mp
L11_1 = L11_1.getfilename
L12_1 = mp
L12_1 = L12_1.bitor
L13_1 = mp
L13_1 = L13_1.FILEPATH_QUERY_FULL
L14_1 = mp
L14_1 = L14_1.FILEPATH_QUERY_LOWERCASE
L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1 = L12_1(L13_1, L14_1)
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1)
L12_1 = string
L12_1 = L12_1.match
L13_1 = L11_1
L14_1 = "(%.[^%.]+)$"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 == nil or L12_1 == "" then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = L4_1[L12_1]
if L13_1 ~= true then
  L13_1 = L5_1[L12_1]
  if L13_1 ~= true then
    L13_1 = L6_1[L12_1]
    if L13_1 ~= true then
      L13_1 = L7_1[L12_1]
      if L13_1 ~= true then
        L13_1 = L8_1[L12_1]
        if L13_1 ~= true then
          L13_1 = L9_1[L12_1]
          if L13_1 ~= true then
            L13_1 = L10_1[L12_1]
            if L13_1 ~= true then
              L13_1 = mp
              L13_1 = L13_1.CLEAN
              return L13_1
            end
          end
        end
      end
    end
  end
end
L13_1 = mp
L13_1 = L13_1.ContextualExpandEnvironmentVariables
L14_1 = "%userprofile%"
L13_1 = L13_1(L14_1)
if L13_1 == nil then
  L14_1 = ""
  if L14_1 then
    goto lbl_240
  end
end
L14_1 = L13_1
::lbl_240::
L15_1 = L14_1
L14_1 = L14_1.lower
L14_1 = L14_1(L15_1)
L13_1 = L14_1
L14_1 = MpCommon
L14_1 = L14_1.ExpandEnvironmentVariables
L15_1 = "%public%"
L14_1 = L14_1(L15_1)
if L14_1 == nil then
  L15_1 = ""
  if L15_1 then
    goto lbl_253
  end
end
L15_1 = L14_1
::lbl_253::
L16_1 = L15_1
L15_1 = L15_1.lower
L15_1 = L15_1(L16_1)
L14_1 = L15_1
L15_1 = string
L15_1 = L15_1.lower
L16_1 = MpCommon
L16_1 = L16_1.PathToWin32Path
L17_1 = L11_1
L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1 = L16_1(L17_1)
L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1)
L16_1 = string
L16_1 = L16_1.find
L17_1 = L15_1
L18_1 = L13_1
L19_1 = "\\documents\\"
L18_1 = L18_1 .. L19_1
L19_1 = 1
L20_1 = true
L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
if L16_1 == nil then
  L16_1 = string
  L16_1 = L16_1.find
  L17_1 = L15_1
  L18_1 = L14_1
  L19_1 = "\\documents\\"
  L18_1 = L18_1 .. L19_1
  L19_1 = 1
  L20_1 = true
  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
  if L16_1 == nil then
    L16_1 = string
    L16_1 = L16_1.find
    L17_1 = L15_1
    L18_1 = L13_1
    L19_1 = "\\pictures\\"
    L18_1 = L18_1 .. L19_1
    L19_1 = 1
    L20_1 = true
    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    if L16_1 == nil then
      L16_1 = string
      L16_1 = L16_1.find
      L17_1 = L15_1
      L18_1 = L14_1
      L19_1 = "\\pictures\\"
      L18_1 = L18_1 .. L19_1
      L19_1 = 1
      L20_1 = true
      L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
      if L16_1 == nil then
        L16_1 = string
        L16_1 = L16_1.find
        L17_1 = L15_1
        L18_1 = L13_1
        L19_1 = "\\videos\\"
        L18_1 = L18_1 .. L19_1
        L19_1 = 1
        L20_1 = true
        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
        if L16_1 == nil then
          L16_1 = string
          L16_1 = L16_1.find
          L17_1 = L15_1
          L18_1 = L14_1
          L19_1 = "\\videos\\"
          L18_1 = L18_1 .. L19_1
          L19_1 = 1
          L20_1 = true
          L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
          if L16_1 == nil then
            L16_1 = string
            L16_1 = L16_1.find
            L17_1 = L15_1
            L18_1 = L13_1
            L19_1 = "\\music\\"
            L18_1 = L18_1 .. L19_1
            L19_1 = 1
            L20_1 = true
            L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
            if L16_1 == nil then
              L16_1 = string
              L16_1 = L16_1.find
              L17_1 = L15_1
              L18_1 = L14_1
              L19_1 = "\\music\\"
              L18_1 = L18_1 .. L19_1
              L19_1 = 1
              L20_1 = true
              L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
              if L16_1 == nil then
                L16_1 = string
                L16_1 = L16_1.find
                L17_1 = L15_1
                L18_1 = L13_1
                L19_1 = "\\favorites\\"
                L18_1 = L18_1 .. L19_1
                L19_1 = 1
                L20_1 = true
                L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                if L16_1 == nil then
                  L16_1 = string
                  L16_1 = L16_1.find
                  L17_1 = L15_1
                  L18_1 = L14_1
                  L19_1 = "\\favorites\\"
                  L18_1 = L18_1 .. L19_1
                  L19_1 = 1
                  L20_1 = true
                  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                  if L16_1 == nil then
                    L16_1 = string
                    L16_1 = L16_1.find
                    L17_1 = L15_1
                    L18_1 = L13_1
                    L19_1 = "\\desktop\\"
                    L18_1 = L18_1 .. L19_1
                    L19_1 = 1
                    L20_1 = true
                    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                    if L16_1 == nil then
                      L16_1 = string
                      L16_1 = L16_1.find
                      L17_1 = L15_1
                      L18_1 = L14_1
                      L19_1 = "\\desktop\\"
                      L18_1 = L18_1 .. L19_1
                      L19_1 = 1
                      L20_1 = true
                      L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                      if L16_1 == nil then
                        L16_1 = string
                        L16_1 = L16_1.find
                        L17_1 = L15_1
                        L18_1 = "c:\\demo\\"
                        L19_1 = 1
                        L20_1 = true
                        L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                        if L16_1 == nil then
                          L16_1 = mp
                          L16_1 = L16_1.CLEAN
                          return L16_1
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L16_1 = {}
L17_1 = {}
L18_1 = false
L19_1 = 0
L20_1 = 0
L21_1 = MpCommon
L21_1 = L21_1.GetPersistContext
L22_1 = L3_1
L21_1 = L21_1(L22_1)
if L21_1 == nil then
  L22_1 = mp
  L22_1 = L22_1.CLEAN
  return L22_1
end
L22_1 = ipairs
L23_1 = L21_1
L22_1, L23_1, L24_1 = L22_1(L23_1)
for L25_1, L26_1 in L22_1, L23_1, L24_1 do
  L27_1 = string
  L27_1 = L27_1.match
  L28_1 = L26_1
  L29_1 = "^RoxstageFile:(.+)$"
  L27_1 = L27_1(L28_1, L29_1)
  if L27_1 ~= nil then
    L20_1 = L20_1 + 1
    L28_1 = table
    L28_1 = L28_1.insert
    L29_1 = L17_1
    L30_1 = "RoxstageFile:"
    L31_1 = L27_1
    L30_1 = L30_1 .. L31_1
    L28_1(L29_1, L30_1)
    L28_1 = sysio
    L28_1 = L28_1.IsFileExists
    L29_1 = L27_1
    L28_1 = L28_1(L29_1)
    if not L28_1 then
      L19_1 = L19_1 + 1
    end
    if L27_1 == L11_1 then
      L18_1 = true
    end
  else
    L28_1 = table
    L28_1 = L28_1.insert
    L29_1 = L16_1
    L30_1 = L26_1
    L28_1(L29_1, L30_1)
  end
end
if L18_1 == false then
  if 30 <= L20_1 then
    L22_1 = {}
    L17_1 = L22_1
  end
  L22_1 = table
  L22_1 = L22_1.insert
  L23_1 = L17_1
  L24_1 = "RoxstageFile:"
  L25_1 = L11_1
  L24_1 = L24_1 .. L25_1
  L22_1(L23_1, L24_1)
end
if 21 <= L19_1 then
  L22_1 = MpCommon
  L22_1 = L22_1.SetPersistContext
  L23_1 = L3_1
  L24_1 = L16_1
  L25_1 = 0
  L22_1(L23_1, L24_1, L25_1)
  L22_1 = MpCommon
  L22_1 = L22_1.QueryPersistContext
  L23_1 = L3_1
  L24_1 = "BM_RoxstageProcessBlock"
  L22_1 = L22_1(L23_1, L24_1)
  if not L22_1 then
    L22_1 = MpCommon
    L22_1 = L22_1.AppendPersistContext
    L23_1 = L3_1
    L24_1 = "BM_RoxstageProcessBlock"
    L25_1 = 0
    L22_1(L23_1, L24_1, L25_1)
  end
  L22_1 = mp
  L22_1 = L22_1.set_mpattribute
  L23_1 = "BM_RoxstageProcessBlock"
  L22_1(L23_1)
  L22_1 = mp
  L22_1 = L22_1.ReportLowfi
  L23_1 = L3_1
  L24_1 = 4007353695
  L22_1(L23_1, L24_1)
else
  L22_1 = ipairs
  L23_1 = L17_1
  L22_1, L23_1, L24_1 = L22_1(L23_1)
  for L25_1, L26_1 in L22_1, L23_1, L24_1 do
    L27_1 = table
    L27_1 = L27_1.insert
    L28_1 = L16_1
    L29_1 = L26_1
    L27_1(L28_1, L29_1)
  end
  L22_1 = MpCommon
  L22_1 = L22_1.SetPersistContext
  L23_1 = L3_1
  L24_1 = L16_1
  L25_1 = 0
  L22_1(L23_1, L24_1, L25_1)
end
L22_1 = mp
L22_1 = L22_1.CLEAN
return L22_1

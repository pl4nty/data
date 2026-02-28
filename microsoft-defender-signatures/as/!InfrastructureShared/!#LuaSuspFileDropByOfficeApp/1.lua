local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "winword.exe|excel.exe|powerpnt.exe|outlook.exe|commsapps.exe|lync.exe|teams.exe|"
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = isOutlookProcess
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_377
  end
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.bitor
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FNAME
L7_1 = mp
L7_1 = L7_1.FILEPATH_QUERY_PATH
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L4_1(L5_1, L6_1)
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L6_1 = L4_1
L5_1 = L4_1.sub
L7_1 = -3
L5_1 = L5_1(L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_SCANREASON
L6_1 = L6_1(L7_1)
L7_1 = false
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "Lua:OfficeApp!"
L10_1 = L1_1
L9_1 = L9_1 .. L10_1
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "Lua:OfficeAppDropped!"
L10_1 = L4_1
L9_1 = L9_1 .. L10_1
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "Lua:OfficeAppDroppedExt!"
L10_1 = L5_1
L9_1 = L9_1 .. L10_1
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L6_1 == L8_1 then
  L8_1 = mp
  L8_1 = L8_1.get_contextdata
  L9_1 = mp
  L9_1 = L9_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L8_1 = L8_1(L9_1)
  if L8_1 == true then
    L8_1 = mp
    L8_1 = L8_1.get_mpattribute
    L9_1 = "BM_ScriptFile"
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "BM_ScriptFileDropByOffcApp"
      L8_1(L9_1)
    end
    L8_1 = mp
    L8_1 = L8_1.get_mpattribute
    L9_1 = "BM_MZ_FILE"
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L9_1 = L3_1
      L8_1 = L3_1.find
      L10_1 = "appdata\\local\\assembly"
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if not L8_1 then
        L9_1 = L3_1
        L8_1 = L3_1.find
        L10_1 = "\\local\\box\\"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if not L8_1 then
          goto lbl_139
        end
      end
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "Lua:OfficeAddinAssemblyExclPath"
      L8_1(L9_1)
      L7_1 = true
      goto lbl_143
      ::lbl_139::
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "BM_PeFileDropByOffcApp"
      L8_1(L9_1)
    end
    ::lbl_143::
    L8_1 = mp
    L8_1 = L8_1.get_mpattribute
    L9_1 = "BM_LNK_FILE"
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "BM_LnkFileDropByOffcApp"
      L8_1(L9_1)
    end
    if L5_1 == "pdf" then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = "BM_PdfDroppedByOfficeApp"
      L8_1(L9_1)
    end
    L8_1 = "tmf|emf|wmf|spl|off|bak|m4a|mp4|mp3|wav|bmp|kgx|idx|etl|log|ico|"
    L9_1 = "aplorislib[1].js|tokencache|temp.db.idx|msip_telemetry.tm-journal|_isres_0x0409.dll"
    L11_1 = L8_1
    L10_1 = L8_1.find
    L12_1 = L5_1
    L10_1 = L10_1(L11_1, L12_1)
    if not L10_1 then
      L11_1 = L9_1
      L10_1 = L9_1.find
      L12_1 = L4_1
      L10_1 = L10_1(L11_1, L12_1)
      if not L10_1 then
        L11_1 = L4_1
        L10_1 = L4_1.match
        L12_1 = "~wrs%{.+%}%.tmp"
        L10_1 = L10_1(L11_1, L12_1)
        if not L10_1 then
          L11_1 = L4_1
          L10_1 = L4_1.match
          L12_1 = "mso.+%.tmp"
          L10_1 = L10_1(L11_1, L12_1)
          if not L10_1 then
            L11_1 = L4_1
            L10_1 = L4_1.match
            L12_1 = "oc.+%.tmp"
            L10_1 = L10_1(L11_1, L12_1)
            if not L10_1 then
              L11_1 = L4_1
              L10_1 = L4_1.match
              L12_1 = "react.+%.js"
              L10_1 = L10_1(L11_1, L12_1)
              if not L10_1 then
                L11_1 = L3_1
                L10_1 = L3_1.find
                L12_1 = "\\office\\recent"
                L13_1 = 1
                L14_1 = true
                L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                if not L10_1 then
                  L11_1 = L3_1
                  L10_1 = L3_1.find
                  L12_1 = "\\windows\\recent"
                  L13_1 = 1
                  L14_1 = true
                  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                  if not L10_1 then
                    L11_1 = L3_1
                    L10_1 = L3_1.find
                    L12_1 = "$recycle.bin"
                    L13_1 = 1
                    L14_1 = true
                    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                    if not L10_1 then
                      L11_1 = L3_1
                      L10_1 = L3_1.find
                      L12_1 = "\\appdata\\roaming\\microsoft\\excel\\.-xlsx?%.lnk"
                      L10_1 = L10_1(L11_1, L12_1)
                      if not L10_1 then
                        L11_1 = L3_1
                        L10_1 = L3_1.find
                        L12_1 = "\\appdata\\roaming\\microsoft\\word\\.-docx?%.lnk"
                        L10_1 = L10_1(L11_1, L12_1)
                        if not L10_1 then
                          L11_1 = L3_1
                          L10_1 = L3_1.find
                          L12_1 = "\\appdata\\roaming\\microsoft\\powerpoint\\.-pptx?%.lnk"
                          L10_1 = L10_1(L11_1, L12_1)
                          if not L10_1 then
                            L11_1 = L3_1
                            L10_1 = L3_1.find
                            L12_1 = "\\microsoft\\teams\\"
                            L13_1 = 1
                            L14_1 = true
                            L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                            if not L10_1 then
                              L11_1 = L3_1
                              L10_1 = L3_1.find
                              L12_1 = "\\windows\\cryptoguard"
                              L13_1 = 1
                              L14_1 = true
                              L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                              if not L10_1 then
                                L11_1 = L3_1
                                L10_1 = L3_1.find
                                L12_1 = "\\microsoft\\msip\\tokencache"
                                L13_1 = 1
                                L14_1 = true
                                L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                if not L10_1 then
                                  L11_1 = L3_1
                                  L10_1 = L3_1.find
                                  L12_1 = "\\internet explorer\\quick launch\\microsoft outlook.lnk"
                                  L13_1 = 1
                                  L14_1 = true
                                  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                  if not L10_1 then
                                    L11_1 = L3_1
                                    L10_1 = L3_1.find
                                    L12_1 = "\\carbonblack\\store"
                                    L13_1 = 1
                                    L14_1 = true
                                    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                    if not L10_1 then
                                      L11_1 = L3_1
                                      L10_1 = L3_1.find
                                      L12_1 = "\\crowdstrike\\downloads"
                                      L13_1 = 1
                                      L14_1 = true
                                      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                      if not L10_1 then
                                        L11_1 = L3_1
                                        L10_1 = L3_1.find
                                        L12_1 = "\\cyvera\\ransomware"
                                        L13_1 = 1
                                        L14_1 = true
                                        L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                        if not L10_1 then
                                          L11_1 = L3_1
                                          L10_1 = L3_1.find
                                          L12_1 = "\\outlook\\offline address books"
                                          L13_1 = 1
                                          L14_1 = true
                                          L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                          if not L10_1 then
                                            L11_1 = L3_1
                                            L10_1 = L3_1.find
                                            L12_1 = "\\slack\\service worker\\cachestorage"
                                            L13_1 = 1
                                            L14_1 = true
                                            L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                            if not L10_1 then
                                              L11_1 = L3_1
                                              L10_1 = L3_1.find
                                              L12_1 = "\\systemcertificates\\my\\certificates\\"
                                              L13_1 = 1
                                              L14_1 = true
                                              L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                              if not L10_1 then
                                                L11_1 = L3_1
                                                L10_1 = L3_1.find
                                                L12_1 = "\\temp\\photocache\\"
                                                L13_1 = 1
                                                L14_1 = true
                                                L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                                if not L10_1 then
                                                  L11_1 = L3_1
                                                  L10_1 = L3_1.find
                                                  L12_1 = "\\windows\\csc\\"
                                                  L13_1 = 1
                                                  L14_1 = true
                                                  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                                                  if not L10_1 then
                                                    goto lbl_312
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
    L7_1 = true
    ::lbl_312::
    if L7_1 then
      L10_1 = mp
      L10_1 = L10_1.set_mpattribute
      L11_1 = "Lua:OfficeAppExcludePath"
      L10_1(L11_1)
    end
    if not L7_1 then
      L11_1 = L3_1
      L10_1 = L3_1.match
      L12_1 = "windows\\temp"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:OfficeAppDroppedIn!wintemp"
        L10_1(L11_1)
      end
      L11_1 = L3_1
      L10_1 = L3_1.match
      L12_1 = "users\\.-\\appdata\\local"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:OfficeAppDroppedIn!localappdata"
        L10_1(L11_1)
      end
      L11_1 = L3_1
      L10_1 = L3_1.match
      L12_1 = "users\\.-\\appdata\\remote"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:OfficeAppDroppedIn!remoteappdata"
        L10_1(L11_1)
      end
      L11_1 = L3_1
      L10_1 = L3_1.match
      L12_1 = "users\\.-\\appdata\\local\\temp"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:OfficeAppDroppedIn!usrtemp"
        L10_1(L11_1)
      end
      L11_1 = L3_1
      L10_1 = L3_1.match
      L12_1 = "users\\.-\\desktop$"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:OfficeAppDroppedIn!usrdesktop"
        L10_1(L11_1)
      end
      L11_1 = L3_1
      L10_1 = L3_1.match
      L12_1 = "users\\.-\\documents$"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:OfficeAppDroppedIn!usrdocs"
        L10_1(L11_1)
      end
    end
  end
end
L8_1 = mp
L8_1 = L8_1.INFECTED
do return L8_1 end
::lbl_377::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

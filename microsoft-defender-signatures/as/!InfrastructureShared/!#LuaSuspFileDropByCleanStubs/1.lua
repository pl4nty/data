local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
if L1_1 == nil then
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
L2_1 = "cscript.exe|wscript.exe|mshta.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe"
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
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
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L4_1(L5_1, L6_1)
  L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
  L6_1 = L4_1
  L5_1 = L4_1.sub
  L7_1 = -3
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = mp
  L6_1 = L6_1.getfilesize
  L6_1 = L6_1()
  L7_1 = false
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:StubApp!"
  L10_1 = L1_1
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:StubAppDropped!"
  L10_1 = L4_1
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:StubAppDroppedExt!"
  L10_1 = L5_1
  L9_1 = L9_1 .. L10_1
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L8_1 then
    L8_1 = mp
    L8_1 = L8_1.get_contextdata
    L9_1 = mp
    L9_1 = L9_1.CONTEXT_DATA_NEWLYCREATEDHINT
    L8_1 = L8_1(L9_1)
    if L8_1 == true then
      L8_1 = "obj|etl|log|pdb|edb|mdb|sdb|tmf|emf|wmf|spl|off|bak|m4a|mp4|mp3|wav|bmp|ico|kgx|idx|.md|tml|tar|ent|iff|ttf|tif|pak|aml|yml|mof|man|che|ore|new|mui"
      L10_1 = L8_1
      L9_1 = L8_1.find
      L11_1 = L5_1
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 then
        L7_1 = true
      end
      L9_1 = mp
      L9_1 = L9_1.get_mpattribute
      L10_1 = "BM_MZ_FILE"
      L9_1 = L9_1(L10_1)
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "BM_PeFileDropByStubApp"
        L9_1(L10_1)
      else
        L9_1 = mp
        L9_1 = L9_1.get_mpattribute
        L10_1 = "BM_LNK_FILE"
        L9_1 = L9_1(L10_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "BM_LnkFileDropByStubApp"
          L9_1(L10_1)
        else
          L9_1 = mp
          L9_1 = L9_1.get_mpattribute
          L10_1 = "BM_ScriptFile"
          L9_1 = L9_1(L10_1)
          if L9_1 then
            L9_1 = mp
            L9_1 = L9_1.set_mpattribute
            L10_1 = "BM_ScriptFileDropByStubApp"
            L9_1(L10_1)
          end
        end
      end
      L10_1 = L3_1
      L9_1 = L3_1.find
      L11_1 = "\\bin\\debug"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if not L9_1 then
        L10_1 = L3_1
        L9_1 = L3_1.find
        L11_1 = "\\office\\recent"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if not L9_1 then
          L10_1 = L4_1
          L9_1 = L4_1.find
          L11_1 = "ladybug.-%.ghuser"
          L9_1 = L9_1(L10_1, L11_1)
          if not L9_1 then
            L10_1 = L3_1
            L9_1 = L3_1.find
            L11_1 = "\\windows\\recent"
            L12_1 = 1
            L13_1 = true
            L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
            if not L9_1 then
              L10_1 = L3_1
              L9_1 = L3_1.find
              L11_1 = "\\bin\\release"
              L12_1 = 1
              L13_1 = true
              L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
              if not L9_1 then
                L10_1 = L3_1
                L9_1 = L3_1.find
                L11_1 = "\\windows\\ccm\\systemtemp"
                L12_1 = 1
                L13_1 = true
                L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                if not L9_1 then
                  L10_1 = L3_1
                  L9_1 = L3_1.find
                  L11_1 = "\\smssig"
                  L12_1 = 1
                  L13_1 = true
                  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                  if not L9_1 then
                    L10_1 = L3_1
                    L9_1 = L3_1.find
                    L11_1 = "\\sccmcontentlib\\"
                    L12_1 = 1
                    L13_1 = true
                    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                    if not L9_1 then
                      L10_1 = L3_1
                      L9_1 = L3_1.find
                      L11_1 = "\\gac\\gac_msil\\"
                      L12_1 = 1
                      L13_1 = true
                      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                      if not L9_1 then
                        L10_1 = L3_1
                        L9_1 = L3_1.find
                        L11_1 = "\\device\\vhdharddisk"
                        L12_1 = 1
                        L13_1 = true
                        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                        if not L9_1 then
                          L10_1 = L3_1
                          L9_1 = L3_1.find
                          L11_1 = "\\bin\\azure.+"
                          L9_1 = L9_1(L10_1, L11_1)
                          if not L9_1 then
                            L10_1 = L3_1
                            L9_1 = L3_1.find
                            L11_1 = "\\start menu\\programs\\.+radc.\\"
                            L9_1 = L9_1(L10_1, L11_1)
                            if not L9_1 then
                              L10_1 = L3_1
                              L9_1 = L3_1.find
                              L11_1 = "microsoft%.microsoftedge.-default\\cachestorage\\files"
                              L9_1 = L9_1(L10_1, L11_1)
                              if not L9_1 then
                                L10_1 = L3_1
                                L9_1 = L3_1.find
                                L11_1 = "\\tanium\\tanium client\\"
                                L12_1 = 1
                                L13_1 = true
                                L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                                if not L9_1 and L4_1 ~= "moduleanalysiscache" then
                                  L10_1 = L4_1
                                  L9_1 = L4_1.find
                                  L11_1 = "powershell_analysiscacheentry"
                                  L12_1 = 1
                                  L13_1 = true
                                  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                                  if not L9_1 and L4_1 ~= "windowsdefenderatponboardingscript.cmd" and L4_1 ~= "retainip-log.txt" and L4_1 ~= "arpproducticon.exe" then
                                    L10_1 = L4_1
                                    L9_1 = L4_1.find
                                    L11_1 = "min%[.%]%.js"
                                    L9_1 = L9_1(L10_1, L11_1)
                                    if not L9_1 then
                                      L10_1 = L4_1
                                      L9_1 = L4_1.find
                                      L11_1 = "%.xml$"
                                      L9_1 = L9_1(L10_1, L11_1)
                                      if not L9_1 then
                                        L10_1 = L4_1
                                        L9_1 = L4_1.find
                                        L11_1 = "%.json$"
                                        L9_1 = L9_1(L10_1, L11_1)
                                        if not L9_1 then
                                          L10_1 = L4_1
                                          L9_1 = L4_1.find
                                          L11_1 = "%.yaml$"
                                          L9_1 = L9_1(L10_1, L11_1)
                                          if not L9_1 then
                                            L10_1 = L4_1
                                            L9_1 = L4_1.find
                                            L11_1 = "%.md$"
                                            L9_1 = L9_1(L10_1, L11_1)
                                            if not L9_1 then
                                              if L6_1 < 100 then
                                                L10_1 = L4_1
                                                L9_1 = L4_1.find
                                                L11_1 = "__psscriptpolicytest_.+%.ps1"
                                                L9_1 = L9_1(L10_1, L11_1)
                                                if L9_1 then
                                                  goto lbl_279
                                                end
                                              end
                                              if L4_1 ~= "notes.ini" then
                                                goto lbl_280
                                              end
                                              L10_1 = L3_1
                                              L9_1 = L3_1.find
                                              L11_1 = "\\lotus\\notes\\data\\"
                                              L12_1 = 1
                                              L13_1 = true
                                              L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
                                              if not L9_1 then
                                                goto lbl_280
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
      ::lbl_279::
      L7_1 = true
      ::lbl_280::
      if L7_1 then
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:CleanStubsExcludePath"
        L9_1(L10_1)
      end
      if not L7_1 then
        L10_1 = L3_1
        L9_1 = L3_1.match
        L11_1 = "windows\\temp"
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:StubAppDroppedIn!wintemp"
          L9_1(L10_1)
        end
        L10_1 = L3_1
        L9_1 = L3_1.match
        L11_1 = "users\\.-\\appdata\\local"
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:StubAppDroppedIn!localappdata"
          L9_1(L10_1)
        end
        L10_1 = L3_1
        L9_1 = L3_1.match
        L11_1 = "users\\.-\\appdata\\remote"
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:StubAppDroppedIn!remoteappdata"
          L9_1(L10_1)
        end
        L10_1 = L3_1
        L9_1 = L3_1.match
        L11_1 = "users\\.-\\appdata\\local\\temp"
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:StubAppDroppedIn!usrtemp"
          L9_1(L10_1)
        end
        L10_1 = L3_1
        L9_1 = L3_1.match
        L11_1 = "users\\.-\\desktop$"
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:StubAppDroppedIn!usrdesktop"
          L9_1(L10_1)
        end
        L10_1 = L3_1
        L9_1 = L3_1.match
        L11_1 = "users\\.-\\documents$"
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:StubAppDroppedIn!usrdocs"
          L9_1(L10_1)
        end
        L10_1 = L3_1
        L9_1 = L3_1.match
        L11_1 = "windows\\inetcache"
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.set_mpattribute
          L10_1 = "Lua:StubAppDroppedIn!inetcache"
          L9_1(L10_1)
        end
      end
    end
  end
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

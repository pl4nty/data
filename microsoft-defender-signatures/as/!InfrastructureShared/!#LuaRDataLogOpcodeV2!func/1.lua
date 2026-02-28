local L0_1, L1_1
L0_1 = pevars
L0_1 = L0_1.logsize
if not (L0_1 < 16) then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if not (2048000 < L0_1) then
    L0_1 = mp
    L0_1 = L0_1.getfilesize
    L0_1 = L0_1()
    if not (L0_1 < 10240) then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Themida_Attr"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "PEPCODE:VirTool:Win32/VMProtect"
        L0_1 = L0_1(L1_1)
        if not L0_1 then
          L0_1 = mp
          L0_1 = L0_1.get_mpattribute
          L1_1 = "Lowfi:HSTR:Win32/Obfuscator.Enigma"
          L0_1 = L0_1(L1_1)
          if not L0_1 then
            L0_1 = mp
            L0_1 = L0_1.get_mpattribute
            L1_1 = "RPF:FileHasTaggant"
            L0_1 = L0_1(L1_1)
            if not L0_1 then
              L0_1 = mp
              L0_1 = L0_1.get_mpattribute
              L1_1 = "SIGATTR:DelphiFile"
              L0_1 = L0_1(L1_1)
              if not L0_1 then
                L0_1 = mp
                L0_1 = L0_1.get_mpattribute
                L1_1 = "HSTR:Trojan:Win32/IsDelphi"
                L0_1 = L0_1(L1_1)
                if not L0_1 then
                  L0_1 = mp
                  L0_1 = L0_1.get_mpattribute
                  L1_1 = "HSTR:Win32/DelphiFile"
                  L0_1 = L0_1(L1_1)
                  if not L0_1 then
                    L0_1 = mp
                    L0_1 = L0_1.get_mpattribute
                    L1_1 = "HSTR:CABSFX_RESOURCES"
                    L0_1 = L0_1(L1_1)
                    if not L0_1 then
                      L0_1 = mp
                      L0_1 = L0_1.get_mpattribute
                      L1_1 = "//InnoSetup_Installer"
                      L0_1 = L0_1(L1_1)
                      if not L0_1 then
                        L0_1 = mp
                        L0_1 = L0_1.get_mpattribute
                        L1_1 = "//Lua:NSIS_Installer"
                        L0_1 = L0_1(L1_1)
                        if not L0_1 then
                          L0_1 = mp
                          L0_1 = L0_1.get_mpattribute
                          L1_1 = "HSTR:NSIS.gen!A"
                          L0_1 = L0_1(L1_1)
                          if not L0_1 then
                            L0_1 = mp
                            L0_1 = L0_1.get_mpattribute
                            L1_1 = "//SmartInstallMaker"
                            L0_1 = L0_1(L1_1)
                            if not L0_1 then
                              L0_1 = mp
                              L0_1 = L0_1.get_mpattribute
                              L1_1 = "HSTR:Win32/Exprio.gen!lowfi"
                              L0_1 = L0_1(L1_1)
                              if not L0_1 then
                                L0_1 = mp
                                L0_1 = L0_1.get_mpattributesubstring
                                L1_1 = "Molebox"
                                L0_1 = L0_1(L1_1)
                                if not L0_1 then
                                  L0_1 = mp
                                  L0_1 = L0_1.get_mpattributesubstring
                                  L1_1 = "AutoIt"
                                  L0_1 = L0_1(L1_1)
                                  if not L0_1 then
                                    L0_1 = mp
                                    L0_1 = L0_1.get_mpattributesubstring
                                    L1_1 = "Virus"
                                    L0_1 = L0_1(L1_1)
                                    if not L0_1 then
                                      goto lbl_114
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
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_114::
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "Lua:RData.LogOpcodeV2"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

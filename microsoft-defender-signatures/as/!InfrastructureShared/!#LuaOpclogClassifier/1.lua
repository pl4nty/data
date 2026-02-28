local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if not (2048000 < L0_1) then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if not (L0_1 < 10240) then
    goto lbl_14
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "is_packed_not_vfo"
L0_1 = L0_1(L1_1)
if not L0_1 then
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
                            L0_1 = L0_1.get_mpattribute
                            L1_1 = "HSTR:Detects_VirtualPC_VMWare"
                            L0_1 = L0_1(L1_1)
                            if not L0_1 then
                              L0_1 = mp
                              L0_1 = L0_1.get_mpattribute
                              L1_1 = "SIGATTR:FindWindowFileMon"
                              L0_1 = L0_1(L1_1)
                              if not L0_1 then
                                L0_1 = mp
                                L0_1 = L0_1.get_mpattribute
                                L1_1 = "HSTR:MinGWFile"
                                L0_1 = L0_1(L1_1)
                                if not L0_1 then
                                  L0_1 = mp
                                  L0_1 = L0_1.get_mpattributesubstring
                                  L1_1 = "HSTR:PossibleVcEpStub"
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
                                          goto lbl_143
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
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_143::
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "Lua:OpclogClassifierThrottle"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

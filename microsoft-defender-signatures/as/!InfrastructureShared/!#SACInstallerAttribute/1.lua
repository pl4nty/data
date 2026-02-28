local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "7zSFX"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = "acesfx"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "lhasfx"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattributesubstring
      L1_1 = "msisfx"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattributesubstring
        L1_1 = "rsfx"
        L0_1 = L0_1(L1_1)
        if not L0_1 then
          L0_1 = mp
          L0_1 = L0_1.get_mpattributesubstring
          L1_1 = "winsfx"
          L0_1 = L0_1(L1_1)
          if not L0_1 then
            L0_1 = mp
            L0_1 = L0_1.get_mpattributesubstring
            L1_1 = "cabsfx"
            L0_1 = L0_1(L1_1)
            if not L0_1 then
              L0_1 = mp
              L0_1 = L0_1.get_mpattributesubstring
              L1_1 = "sfxcab"
              L0_1 = L0_1(L1_1)
              if not L0_1 then
                L0_1 = mp
                L0_1 = L0_1.get_mpattributesubstring
                L1_1 = "ZipSFX"
                L0_1 = L0_1(L1_1)
                if not L0_1 then
                  L0_1 = mp
                  L0_1 = L0_1.get_mpattributesubstring
                  L1_1 = "NSIS"
                  L0_1 = L0_1(L1_1)
                  if not L0_1 then
                    L0_1 = mp
                    L0_1 = L0_1.get_mpattributesubstring
                    L1_1 = "RARSFX"
                    L0_1 = L0_1(L1_1)
                    if not L0_1 then
                      L0_1 = mp
                      L0_1 = L0_1.get_mpattributesubstring
                      L1_1 = "sfxrar"
                      L0_1 = L0_1(L1_1)
                      if not L0_1 then
                        L0_1 = mp
                        L0_1 = L0_1.get_mpattributesubstring
                        L1_1 = "InnoSetup"
                        L0_1 = L0_1(L1_1)
                        if not L0_1 then
                          L0_1 = mp
                          L0_1 = L0_1.get_mpattributesubstring
                          L1_1 = "CreateInstall"
                          L0_1 = L0_1(L1_1)
                          if not L0_1 then
                            L0_1 = mp
                            L0_1 = L0_1.get_mpattributesubstring
                            L1_1 = "PyInstaller"
                            L0_1 = L0_1(L1_1)
                            if not L0_1 then
                              L0_1 = mp
                              L0_1 = L0_1.get_mpattributesubstring
                              L1_1 = "InstallShield"
                              L0_1 = L0_1(L1_1)
                              if not L0_1 then
                                goto lbl_100
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
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_100::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

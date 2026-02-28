local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 300 or 500000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 ~= nil and L1_1 ~= "" then
  L2_1 = MpCommon
  L2_1 = L2_1.PathToWin32Path
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = IsInternetCache
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if true ~= L2_1 then
    L2_1 = IsLowConfNPath
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if true ~= L2_1 then
      goto lbl_43
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_43::
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\\program files\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "\\clientaccess\\owa\\prem\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = ":\\windows\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = ":\\program files (x86)\\"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L3_1 = L1_1
          L2_1 = L1_1.find
          L4_1 = "\\google\\chrome\\user data\\default\\extensions\\"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            L3_1 = L1_1
            L2_1 = L1_1.find
            L4_1 = "\\google\\chrome\\user data\\profile"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L3_1 = L1_1
              L2_1 = L1_1.find
              L4_1 = "\\device\\harddiskvolume"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L3_1 = L1_1
                L2_1 = L1_1.find
                L4_1 = ":\\inetpub\\"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  L3_1 = L1_1
                  L2_1 = L1_1.find
                  L4_1 = "\\netlogon\\"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if not L2_1 then
                    L3_1 = L1_1
                    L2_1 = L1_1.find
                    L4_1 = ":\\programdata\\microsoft\\grouppolicy\\users\\"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if not L2_1 then
                      L3_1 = L1_1
                      L2_1 = L1_1.find
                      L4_1 = "\\mozilla\\firefox\\profiles\\"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if not L2_1 then
                        L3_1 = L1_1
                        L2_1 = L1_1.find
                        L4_1 = "\\programdata\\lenovo\\userguide"
                        L5_1 = 1
                        L6_1 = true
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if not L2_1 then
                          L3_1 = L1_1
                          L2_1 = L1_1.find
                          L4_1 = "\\$recycle.bin\\"
                          L5_1 = 1
                          L6_1 = true
                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                          if not L2_1 then
                            L3_1 = L1_1
                            L2_1 = L1_1.find
                            L4_1 = "\\appdata\\roaming\\aida\\"
                            L5_1 = 1
                            L6_1 = true
                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                            if not L2_1 then
                              goto lbl_144
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
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_144::
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

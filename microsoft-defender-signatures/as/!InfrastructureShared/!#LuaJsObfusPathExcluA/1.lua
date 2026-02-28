local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -3
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = -4
  L2_1 = L2_1(L3_1, L4_1)
  L4_1 = L0_1
  L3_1 = L0_1.match
  L5_1 = "%->.+/"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L4_1 = L0_1
    L3_1 = L0_1.match
    L5_1 = "%->.+\\"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L4_1 = L0_1
      L3_1 = L0_1.match
      L5_1 = "%->.+%->"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        goto lbl_37
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_37::
  if L1_1 == ".js" or L2_1 == ".jse" or L2_1 == ".vbs" or L2_1 == ".vbe" or L2_1 == ".wsf" then
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = mp
    L4_1 = L4_1.getfilename
    L5_1 = mp
    L5_1 = L5_1.bitor
    L6_1 = mp
    L6_1 = L6_1.FILEPATH_QUERY_FULL
    L7_1 = mp
    L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
    L5_1, L6_1, L7_1, L8_1, L9_1 = L5_1(L6_1, L7_1)
    L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    if L3_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = IsInternetCache
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if true == L4_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = ":\\users\\[^\\]+\\appdata\\local\\temp"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = string
      L4_1 = L4_1.match
      L5_1 = L3_1
      L6_1 = "\\appdata\\local\\temp\\(.+)"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L6_1 = L4_1
        L5_1 = L4_1.find
        L7_1 = "\\"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = "Lua:JsObfusPathInclusion.A"
          L5_1(L6_1)
        end
      end
    end
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "\\program files\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "\\clientaccess\\owa\\prem\\"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = ":\\windows\\"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.find
          L6_1 = ":\\program files (x86)\\"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L5_1 = L3_1
            L4_1 = L3_1.find
            L6_1 = "\\google\\chrome\\user data\\default\\extensions\\"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L5_1 = L3_1
              L4_1 = L3_1.find
              L6_1 = "\\google\\chrome\\user data\\profile"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                L5_1 = L3_1
                L4_1 = L3_1.find
                L6_1 = "\\device\\harddiskvolume"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if not L4_1 then
                  L5_1 = L3_1
                  L4_1 = L3_1.find
                  L6_1 = ":\\inetpub\\"
                  L7_1 = 1
                  L8_1 = true
                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                  if not L4_1 then
                    L5_1 = L3_1
                    L4_1 = L3_1.find
                    L6_1 = "\\netlogon\\"
                    L7_1 = 1
                    L8_1 = true
                    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                    if not L4_1 then
                      L5_1 = L3_1
                      L4_1 = L3_1.find
                      L6_1 = ":\\programdata\\microsoft\\grouppolicy\\users\\"
                      L7_1 = 1
                      L8_1 = true
                      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                      if not L4_1 then
                        L5_1 = L3_1
                        L4_1 = L3_1.find
                        L6_1 = "\\mozilla\\firefox\\profiles\\"
                        L7_1 = 1
                        L8_1 = true
                        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                        if not L4_1 then
                          L5_1 = L3_1
                          L4_1 = L3_1.find
                          L6_1 = "\\programdata\\lenovo\\userguide"
                          L7_1 = 1
                          L8_1 = true
                          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                          if not L4_1 then
                            L5_1 = L3_1
                            L4_1 = L3_1.find
                            L6_1 = "\\google\\chrome\\user data\\default\\extensions"
                            L7_1 = 1
                            L8_1 = true
                            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                            if not L4_1 then
                              L5_1 = L3_1
                              L4_1 = L3_1.find
                              L6_1 = "documents and settings"
                              L7_1 = 1
                              L8_1 = true
                              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                              if not L4_1 then
                                goto lbl_199
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
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
::lbl_199::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

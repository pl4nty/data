local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 300 or 800000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1, L5_1)
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = -3
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L2_1
L6_1 = -4
L4_1 = L4_1(L5_1, L6_1)
if L3_1 ~= ".js" and L4_1 ~= ".jse" and L4_1 ~= ".vbs" and L4_1 ~= ".vbe" and L4_1 ~= ".wsf" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L1_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = IsInternetCache
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if true ~= L5_1 then
  L5_1 = IsLowConfNPath
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  if true ~= L5_1 then
    goto lbl_73
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_73::
L6_1 = L1_1
L5_1 = L1_1.find
L7_1 = "\\program files\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L6_1 = L1_1
  L5_1 = L1_1.find
  L7_1 = "\\clientaccess\\owa\\prem\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L6_1 = L1_1
    L5_1 = L1_1.find
    L7_1 = ":\\windows\\"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L6_1 = L1_1
      L5_1 = L1_1.find
      L7_1 = ":\\program files (x86)\\"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L6_1 = L1_1
        L5_1 = L1_1.find
        L7_1 = "\\google\\chrome\\user data\\default\\extensions\\"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L6_1 = L1_1
          L5_1 = L1_1.find
          L7_1 = "\\google\\chrome\\user data\\profile"
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L6_1 = L1_1
            L5_1 = L1_1.find
            L7_1 = "\\device\\harddiskvolume"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L6_1 = L1_1
              L5_1 = L1_1.find
              L7_1 = ":\\inetpub\\"
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                L6_1 = L1_1
                L5_1 = L1_1.find
                L7_1 = "\\netlogon\\"
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if not L5_1 then
                  L6_1 = L1_1
                  L5_1 = L1_1.find
                  L7_1 = "\\device\\vhdharddisk"
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if not L5_1 then
                    L6_1 = L1_1
                    L5_1 = L1_1.find
                    L7_1 = ":\\programdata\\microsoft\\grouppolicy\\users\\"
                    L8_1 = 1
                    L9_1 = true
                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                    if not L5_1 then
                      L6_1 = L1_1
                      L5_1 = L1_1.find
                      L7_1 = "\\mozilla\\firefox\\profiles\\"
                      L8_1 = 1
                      L9_1 = true
                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                      if not L5_1 then
                        L6_1 = L1_1
                        L5_1 = L1_1.find
                        L7_1 = "\\programdata\\lenovo\\userguide"
                        L8_1 = 1
                        L9_1 = true
                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                        if not L5_1 then
                          L6_1 = L1_1
                          L5_1 = L1_1.find
                          L7_1 = "\\appdata\\roaming\\aida\\"
                          L8_1 = 1
                          L9_1 = true
                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                          if not L5_1 then
                            L6_1 = L1_1
                            L5_1 = L1_1.find
                            L7_1 = "\\newos\\windows\\system32\\"
                            L8_1 = 1
                            L9_1 = true
                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                            if not L5_1 then
                              L6_1 = L1_1
                              L5_1 = L1_1.find
                              L7_1 = "\\sentinel\\cache\\"
                              L8_1 = 1
                              L9_1 = true
                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                              if not L5_1 then
                                L6_1 = L1_1
                                L5_1 = L1_1.find
                                L7_1 = "\\backup\\"
                                L8_1 = 1
                                L9_1 = true
                                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                if not L5_1 then
                                  goto lbl_195
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
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_195::
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "^\\\\[^\\]+\\"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L2_1
L5_1 = L2_1.find
L7_1 = "login_settings_gpc30.vbs"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L6_1 = L1_1
  L5_1 = L1_1.find
  L7_1 = "toc13.js"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L6_1 = L1_1
    L5_1 = L1_1.find
    L7_1 = "mcafeecertinstall_slt.vbs"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      goto lbl_229
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_229::
L6_1 = L2_1
L5_1 = L2_1.match
L7_1 = "%->.+/"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L6_1 = L2_1
  L5_1 = L2_1.match
  L7_1 = "%->.+\\"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L6_1 = L2_1
    L5_1 = L2_1.match
    L7_1 = "%->.+%->"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      goto lbl_247
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_247::
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "Lua:ObfusJsVbsML.Throttle"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1

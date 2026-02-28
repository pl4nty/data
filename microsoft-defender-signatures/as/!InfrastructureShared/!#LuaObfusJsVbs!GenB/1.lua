local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 300 or 500000 < L0_1 then
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
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1, L5_1)
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsInternetCache
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if true ~= L3_1 then
  L3_1 = IsLowConfNPath
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if true ~= L3_1 then
    goto lbl_64
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_64::
L4_1 = L1_1
L3_1 = L1_1.find
L5_1 = "\\program files\\"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "\\clientaccess\\owa\\prem\\"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = ":\\windows\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = ":\\program files (x86)\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\google\\chrome\\user data\\default\\extensions\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L1_1
          L3_1 = L1_1.find
          L5_1 = "\\google\\chrome\\user data\\profile"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L1_1
            L3_1 = L1_1.find
            L5_1 = "\\device\\harddiskvolume"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L1_1
              L3_1 = L1_1.find
              L5_1 = ":\\inetpub\\"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L4_1 = L1_1
                L3_1 = L1_1.find
                L5_1 = "\\netlogon\\"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  L4_1 = L1_1
                  L3_1 = L1_1.find
                  L5_1 = ":\\programdata\\microsoft\\grouppolicy\\users\\"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if not L3_1 then
                    L4_1 = L1_1
                    L3_1 = L1_1.find
                    L5_1 = "\\mozilla\\firefox\\profiles\\"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if not L3_1 then
                      L4_1 = L1_1
                      L3_1 = L1_1.find
                      L5_1 = "\\programdata\\lenovo\\userguide"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if not L3_1 then
                        L4_1 = L1_1
                        L3_1 = L1_1.find
                        L5_1 = "\\google\\chrome\\user data\\default\\extensions"
                        L6_1 = 1
                        L7_1 = true
                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                        if not L3_1 then
                          L4_1 = L1_1
                          L3_1 = L1_1.find
                          L5_1 = "\\appdata\\roaming\\aida\\"
                          L6_1 = 1
                          L7_1 = true
                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                          if not L3_1 then
                            goto lbl_165
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
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_165::
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "^\\\\[^\\]+\\"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "support_menu.vbs"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = "bku_plus_connect.vbs"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "replaceagent.vbs"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "install.vbs"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "setdefaultappbyprotocol.vbs"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L1_1
          L3_1 = L1_1.find
          L5_1 = "gis-admin_cfg_"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L1_1
            L3_1 = L1_1.find
            L5_1 = "mk_inventory.vbs"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              goto lbl_227
            end
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_227::
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
L3_1 = L3_1(L4_1)
L4_1 = L3_1
L3_1 = L3_1.lower
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L5_1 = L3_1
  L4_1 = L3_1.match
  L6_1 = "[^\\]+$"
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = {}
  L5_1["wscript.exe"] = ""
  L5_1["cscript.exe"] = ""
  L5_1["explorer.exe"] = ""
  if L4_1 ~= nil then
    L6_1 = L5_1[L4_1]
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

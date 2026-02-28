local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 204800 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.PointerToRawData
L2_1 = pesecs
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L2_1 = L2_1[L3_1]
L2_1 = L2_1.SizeOfRawData
L1_1 = L1_1 + L2_1
L2_1 = L0_1 - L1_1
if L2_1 < 256 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = L1_1
L4_1 = 256
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "      www.winzip.com\000\000\000-win32 -"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "LUA:WinZip_winsfx"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
else
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "PK\003\004"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "LUA:PKinOverlay_Installer"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  else
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "MSCF\000"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "LUA:MSCFinOverlay_Installer"
      L3_1(L4_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    else
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "\208\207\017\224\161\177\026\225"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "LUA:OLEinOverlay_Installer"
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      else
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "/0\238\031^N\229\030"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.set_mpattribute
          L4_1 = "LUA:Advanced_Installer"
          L3_1(L4_1)
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        else
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L2_1
          L5_1 = "\167\135\b\000"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if L3_1 == 1 then
            L3_1 = mp
            L3_1 = L3_1.set_mpattribute
            L4_1 = "LUA:InstallFactory_Installer"
            L3_1(L4_1)
            L3_1 = mp
            L3_1 = L3_1.INFECTED
            return L3_1
          else
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L2_1
            L5_1 = "\213\019\228\232\001\000\000\000"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if L3_1 then
              L3_1 = mp
              L3_1 = L3_1.set_mpattribute
              L4_1 = "LUA:Install4j_Installer"
              L3_1(L4_1)
              L3_1 = mp
              L3_1 = L3_1.INFECTED
              return L3_1
            else
              L3_1 = string
              L3_1 = L3_1.find
              L4_1 = L2_1
              L5_1 = "SPIS\026LH5"
              L6_1 = 5
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if L3_1 then
                L3_1 = mp
                L3_1 = L3_1.set_mpattribute
                L4_1 = "LUA:GPInstall_Installer"
                L3_1(L4_1)
                L3_1 = mp
                L3_1 = L3_1.INFECTED
                return L3_1
              else
                L3_1 = string
                L3_1 = L3_1.find
                L4_1 = L2_1
                L5_1 = "ExcelsiorII1"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if L3_1 then
                  L3_1 = mp
                  L3_1 = L3_1.set_mpattribute
                  L4_1 = "LUA:Excelsior_Installer"
                  L3_1(L4_1)
                  L3_1 = mp
                  L3_1 = L3_1.INFECTED
                  return L3_1
                else
                  L3_1 = string
                  L3_1 = L3_1.find
                  L4_1 = L2_1
                  L5_1 = "ASWsetupFPkgFil3"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if L3_1 then
                    L3_1 = mp
                    L3_1 = L3_1.set_mpattribute
                    L4_1 = "LUA:Avast_Installer"
                    L3_1(L4_1)
                    L3_1 = mp
                    L3_1 = L3_1.INFECTED
                    return L3_1
                  else
                    L3_1 = string
                    L3_1 = L3_1.find
                    L4_1 = L2_1
                    L5_1 = ".eh_frame\000"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if L3_1 == 5 then
                      L3_1 = mp
                      L3_1 = L3_1.set_mpattribute
                      L4_1 = "LUA:BitRock_Installer"
                      L3_1(L4_1)
                      L3_1 = mp
                      L3_1 = L3_1.INFECTED
                      return L3_1
                    else
                      L3_1 = string
                      L3_1 = L3_1.find
                      L4_1 = L2_1
                      L5_1 = "\v\v\175\175\v\v\164"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if L3_1 == 1 then
                        L3_1 = mp
                        L3_1 = L3_1.set_mpattribute
                        L4_1 = "LUA:AutoPlayMedia_Installer"
                        L3_1(L4_1)
                        L3_1 = mp
                        L3_1 = L3_1.INFECTED
                        return L3_1
                      else
                        L3_1 = string
                        L3_1 = L3_1.find
                        L4_1 = L2_1
                        L5_1 = "$_BIM_CONFIG_START_$"
                        L6_1 = 1
                        L7_1 = true
                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                        if L3_1 == 1 then
                          L3_1 = mp
                          L3_1 = L3_1.set_mpattribute
                          L4_1 = "LUA:Bytessence_Installer"
                          L3_1(L4_1)
                          L3_1 = mp
                          L3_1 = L3_1.INFECTED
                          return L3_1
                        else
                          L3_1 = string
                          L3_1 = L3_1.find
                          L4_1 = L2_1
                          L5_1 = "'c'c\018&\tu\019\024\001x"
                          L6_1 = 1
                          L7_1 = true
                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                          if L3_1 == 1 then
                            L3_1 = mp
                            L3_1 = L3_1.set_mpattribute
                            L4_1 = "LUA:ChaosSoftware_Installer"
                            L3_1(L4_1)
                            L3_1 = mp
                            L3_1 = L3_1.INFECTED
                            return L3_1
                          else
                            L3_1 = string
                            L3_1 = L3_1.find
                            L4_1 = L2_1
                            L5_1 = "wwgT)"
                            L6_1 = 1
                            L7_1 = true
                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                            if L3_1 == 1 then
                              L3_1 = mp
                              L3_1 = L3_1.set_mpattribute
                              L4_1 = "LUA:ClickTeam_Installer"
                              L3_1(L4_1)
                              L3_1 = mp
                              L3_1 = L3_1.INFECTED
                              return L3_1
                            else
                              L3_1 = string
                              L3_1 = L3_1.find
                              L4_1 = L2_1
                              L5_1 = "GRCSETUPINFORMATION"
                              L6_1 = 1
                              L7_1 = true
                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                              if L3_1 == 5 then
                                L3_1 = mp
                                L3_1 = L3_1.set_mpattribute
                                L4_1 = "LUA:Codegear_Installer"
                                L3_1(L4_1)
                                L3_1 = mp
                                L3_1 = L3_1.INFECTED
                                return L3_1
                              else
                                L3_1 = string
                                L3_1 = L3_1.find
                                L4_1 = L2_1
                                L5_1 = "\002\006\n\004\005\253Y"
                                L6_1 = 1
                                L7_1 = true
                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                if L3_1 == 1 then
                                  L3_1 = mp
                                  L3_1 = L3_1.set_mpattribute
                                  L4_1 = "LUA:CreateInstall_Installer"
                                  L3_1(L4_1)
                                  L3_1 = mp
                                  L3_1 = L3_1.INFECTED
                                  return L3_1
                                else
                                  L3_1 = string
                                  L3_1 = L3_1.find
                                  L4_1 = L2_1
                                  L5_1 = "aWAW"
                                  L6_1 = 1
                                  L7_1 = true
                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                  if L3_1 == 1 then
                                    L3_1 = mp
                                    L3_1 = L3_1.set_mpattribute
                                    L4_1 = "LUA:CreateInstall2_Installer"
                                    L3_1(L4_1)
                                    L3_1 = mp
                                    L3_1 = L3_1.INFECTED
                                    return L3_1
                                  else
                                    L3_1 = string
                                    L3_1 = L3_1.find
                                    L4_1 = L2_1
                                    L5_1 = "CK16"
                                    L6_1 = 1
                                    L7_1 = true
                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                    if L3_1 == 1 then
                                      L3_1 = mp
                                      L3_1 = L3_1.set_mpattribute
                                      L4_1 = "LUA:CrypKey_Installer"
                                      L3_1(L4_1)
                                      L3_1 = mp
                                      L3_1 = L3_1.INFECTED
                                      return L3_1
                                    else
                                      L3_1 = string
                                      L3_1 = L3_1.find
                                      L4_1 = L2_1
                                      L5_1 = "BZh91AY&SY"
                                      L6_1 = 1
                                      L7_1 = true
                                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                      if L3_1 == 1 then
                                        L3_1 = mp
                                        L3_1 = L3_1.set_mpattribute
                                        L4_1 = "LUA:Spoon_Installer"
                                        L3_1(L4_1)
                                        L3_1 = mp
                                        L3_1 = L3_1.INFECTED
                                        return L3_1
                                      else
                                        L3_1 = string
                                        L3_1 = L3_1.find
                                        L4_1 = L2_1
                                        L5_1 = "[metadata]"
                                        L6_1 = 1
                                        L7_1 = true
                                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                        if L3_1 == 1 then
                                          L3_1 = mp
                                          L3_1 = L3_1.set_mpattribute
                                          L4_1 = "LUA:Distutils_Installer"
                                          L3_1(L4_1)
                                          L3_1 = mp
                                          L3_1 = L3_1.INFECTED
                                          return L3_1
                                        else
                                          L3_1 = string
                                          L3_1 = L3_1.find
                                          L4_1 = L2_1
                                          L5_1 = "EPSF"
                                          L6_1 = 1
                                          L7_1 = true
                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                          if L3_1 == 1 then
                                            L3_1 = mp
                                            L3_1 = L3_1.set_mpattribute
                                            L4_1 = "LUA:Eschalon_Installer"
                                            L3_1(L4_1)
                                            L3_1 = mp
                                            L3_1 = L3_1.INFECTED
                                            return L3_1
                                          else
                                            L3_1 = string
                                            L3_1 = L3_1.find
                                            L4_1 = L2_1
                                            L5_1 = "###FDMDATA###"
                                            L6_1 = 1
                                            L7_1 = true
                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                            if L3_1 == 1 then
                                              L3_1 = mp
                                              L3_1 = L3_1.set_mpattribute
                                              L4_1 = "LUA:FDM_Installer"
                                              L3_1(L4_1)
                                              L3_1 = mp
                                              L3_1 = L3_1.INFECTED
                                              return L3_1
                                            else
                                              L3_1 = string
                                              L3_1 = L3_1.find
                                              L4_1 = L2_1
                                              L5_1 = "\192\222\206\203\141\141\141\141"
                                              L6_1 = 1
                                              L7_1 = true
                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                              if L3_1 == 1 then
                                                L3_1 = mp
                                                L3_1 = L3_1.set_mpattribute
                                                L4_1 = "LUA:Ghost_Installer"
                                                L3_1(L4_1)
                                                L3_1 = mp
                                                L3_1 = L3_1.INFECTED
                                                return L3_1
                                              else
                                                L3_1 = string
                                                L3_1 = L3_1.find
                                                L4_1 = L2_1
                                                L5_1 = "\189\166\238\233\249\237\239\237\229\237"
                                                L6_1 = 1
                                                L7_1 = true
                                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                if L3_1 == 1 then
                                                  L3_1 = mp
                                                  L3_1 = L3_1.set_mpattribute
                                                  L4_1 = "LUA:Hamrick_Installer"
                                                  L3_1(L4_1)
                                                  L3_1 = mp
                                                  L3_1 = L3_1.INFECTED
                                                  return L3_1
                                                else
                                                  L3_1 = string
                                                  L3_1 = L3_1.find
                                                  L4_1 = L2_1
                                                  L5_1 = "XXataDfOnigeB"
                                                  L6_1 = 1
                                                  L7_1 = true
                                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                  if L3_1 == 1 then
                                                    L3_1 = mp
                                                    L3_1 = L3_1.set_mpattribute
                                                    L4_1 = "LUA:ID_Media_Installer"
                                                    L3_1(L4_1)
                                                    L3_1 = mp
                                                    L3_1 = L3_1.INFECTED
                                                    return L3_1
                                                  else
                                                    L3_1 = string
                                                    L3_1 = L3_1.find
                                                    L4_1 = L2_1
                                                    L5_1 = "*3\000\000\218\005\000\000\254\193\205fn\188\207\001\254\193\205fn\188\207\001\000"
                                                    L6_1 = 1
                                                    L7_1 = true
                                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                    if L3_1 == 1 then
                                                      L3_1 = mp
                                                      L3_1 = L3_1.set_mpattribute
                                                      L4_1 = "LUA:IDM_Installer"
                                                      L3_1(L4_1)
                                                      L3_1 = mp
                                                      L3_1 = L3_1.INFECTED
                                                      return L3_1
                                                    else
                                                      L3_1 = string
                                                      L3_1 = L3_1.find
                                                      L4_1 = L2_1
                                                      L5_1 = "stgc_hdr"
                                                      L6_1 = 1
                                                      L7_1 = true
                                                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                      if L3_1 == 1 then
                                                        L3_1 = mp
                                                        L3_1 = L3_1.set_mpattribute
                                                        L4_1 = "LUA:Intenium_Installer"
                                                        L3_1(L4_1)
                                                        L3_1 = mp
                                                        L3_1 = L3_1.INFECTED
                                                        return L3_1
                                                      else
                                                        L3_1 = string
                                                        L3_1 = L3_1.find
                                                        L4_1 = L2_1
                                                        L5_1 = "TARTARTARTARTART"
                                                        L6_1 = 1
                                                        L7_1 = true
                                                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                        if L3_1 == 1 then
                                                          L3_1 = mp
                                                          L3_1 = L3_1.set_mpattribute
                                                          L4_1 = "LUA:MiKTeX_Installer"
                                                          L3_1(L4_1)
                                                          L3_1 = mp
                                                          L3_1 = L3_1.INFECTED
                                                          return L3_1
                                                        else
                                                          L3_1 = string
                                                          L3_1 = L3_1.find
                                                          L4_1 = L2_1
                                                          L5_1 = "[(*|*)]MZ"
                                                          L6_1 = 1
                                                          L7_1 = true
                                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                          if L3_1 == 1 then
                                                            L3_1 = mp
                                                            L3_1 = L3_1.set_mpattribute
                                                            L4_1 = "LUA:Mioplanet_Installer"
                                                            L3_1(L4_1)
                                                            L3_1 = mp
                                                            L3_1 = L3_1.INFECTED
                                                            return L3_1
                                                          else
                                                            L3_1 = string
                                                            L3_1 = L3_1.find
                                                            L4_1 = L2_1
                                                            L5_1 = "wwwwI\135G\018"
                                                            L6_1 = 1
                                                            L7_1 = true
                                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                            if L3_1 == 1 then
                                                              L3_1 = mp
                                                              L3_1 = L3_1.set_mpattribute
                                                              L4_1 = "LUA:MultimediaFusion_Installer"
                                                              L3_1(L4_1)
                                                              L3_1 = mp
                                                              L3_1 = L3_1.INFECTED
                                                              return L3_1
                                                            else
                                                              L3_1 = string
                                                              L3_1 = L3_1.find
                                                              L4_1 = L2_1
                                                              L5_1 = "\151\003\000\000\002\001"
                                                              L6_1 = 1
                                                              L7_1 = true
                                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                              if L3_1 == 1 then
                                                                L3_1 = mp
                                                                L3_1 = L3_1.set_mpattribute
                                                                L4_1 = "LUA:PantarayQSetup_Installer"
                                                                L3_1(L4_1)
                                                                L3_1 = mp
                                                                L3_1 = L3_1.INFECTED
                                                                return L3_1
                                                              else
                                                                L3_1 = string
                                                                L3_1 = L3_1.find
                                                                L4_1 = L2_1
                                                                L5_1 = "7\a\000\000\002\001"
                                                                L6_1 = 1
                                                                L7_1 = true
                                                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                if L3_1 == 1 then
                                                                  L3_1 = mp
                                                                  L3_1 = L3_1.set_mpattribute
                                                                  L4_1 = "LUA:PantarayQSetup2_Installer"
                                                                  L3_1(L4_1)
                                                                  L3_1 = mp
                                                                  L3_1 = L3_1.INFECTED
                                                                  return L3_1
                                                                else
                                                                  L3_1 = string
                                                                  L3_1 = L3_1.find
                                                                  L4_1 = L2_1
                                                                  L5_1 = "PIMPFILE\000"
                                                                  L6_1 = 1
                                                                  L7_1 = true
                                                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                  if L3_1 == 1 then
                                                                    L3_1 = mp
                                                                    L3_1 = L3_1.set_mpattribute
                                                                    L4_1 = "LUA:PIMP_Installer"
                                                                    L3_1(L4_1)
                                                                    L3_1 = mp
                                                                    L3_1 = L3_1.INFECTED
                                                                    return L3_1
                                                                  else
                                                                    L3_1 = string
                                                                    L3_1 = L3_1.find
                                                                    L4_1 = L2_1
                                                                    L5_1 = "\224\224\225\225\226\226\227\227\228\228\229\229\230\230\231\231"
                                                                    L6_1 = 1
                                                                    L7_1 = true
                                                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                    if L3_1 == 1 then
                                                                      L3_1 = mp
                                                                      L3_1 = L3_1.set_mpattribute
                                                                      L4_1 = "LUA:SetupFactory_Installer"
                                                                      L3_1(L4_1)
                                                                      L3_1 = mp
                                                                      L3_1 = L3_1.INFECTED
                                                                      return L3_1
                                                                    else
                                                                      L3_1 = string
                                                                      L3_1 = L3_1.find
                                                                      L4_1 = L2_1
                                                                      L5_1 = "\224\225\226\227\228\229\230"
                                                                      L6_1 = 1
                                                                      L7_1 = true
                                                                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                      if L3_1 == 1 then
                                                                        L3_1 = mp
                                                                        L3_1 = L3_1.set_mpattribute
                                                                        L4_1 = "LUA:SetupFactory2_Installer"
                                                                        L3_1(L4_1)
                                                                        L3_1 = mp
                                                                        L3_1 = L3_1.INFECTED
                                                                        return L3_1
                                                                      else
                                                                        L3_1 = string
                                                                        L3_1 = L3_1.find
                                                                        L4_1 = L2_1
                                                                        L5_1 = "Smart Install Maker v"
                                                                        L6_1 = 1
                                                                        L7_1 = true
                                                                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                        if L3_1 then
                                                                          L3_1 = mp
                                                                          L3_1 = L3_1.set_mpattribute
                                                                          L4_1 = "LUA:SmartInstallMaker_Installer"
                                                                          L3_1(L4_1)
                                                                          L3_1 = mp
                                                                          L3_1 = L3_1.INFECTED
                                                                          return L3_1
                                                                        else
                                                                          L3_1 = string
                                                                          L3_1 = L3_1.find
                                                                          L4_1 = L2_1
                                                                          L5_1 = "UM\003\n\000"
                                                                          L6_1 = 1
                                                                          L7_1 = true
                                                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                          if L3_1 == 1 then
                                                                            L3_1 = mp
                                                                            L3_1 = L3_1.set_mpattribute
                                                                            L4_1 = "LUA:SonyWindows_Installer"
                                                                            L3_1(L4_1)
                                                                            L3_1 = mp
                                                                            L3_1 = L3_1.INFECTED
                                                                            return L3_1
                                                                          else
                                                                            L3_1 = string
                                                                            L3_1 = L3_1.find
                                                                            L4_1 = L2_1
                                                                            L5_1 = "g\021R4\255M6B"
                                                                            L6_1 = 1
                                                                            L7_1 = true
                                                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                            if L3_1 == 1 then
                                                                              L3_1 = mp
                                                                              L3_1 = L3_1.set_mpattribute
                                                                              L4_1 = "LUA:Staticsup_Installer"
                                                                              L3_1(L4_1)
                                                                              L3_1 = mp
                                                                              L3_1 = L3_1.INFECTED
                                                                              return L3_1
                                                                            else
                                                                              L3_1 = string
                                                                              L3_1 = L3_1.find
                                                                              L4_1 = L2_1
                                                                              L5_1 = "This is the end of the executable"
                                                                              L6_1 = 1
                                                                              L7_1 = true
                                                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                              if L3_1 == 1 then
                                                                                L3_1 = mp
                                                                                L3_1 = L3_1.set_mpattribute
                                                                                L4_1 = "LUA:SwiftView_Installer"
                                                                                L3_1(L4_1)
                                                                                L3_1 = mp
                                                                                L3_1 = L3_1.INFECTED
                                                                                return L3_1
                                                                              else
                                                                                L3_1 = string
                                                                                L3_1 = L3_1.find
                                                                                L4_1 = L2_1
                                                                                L5_1 = "CINSTRT"
                                                                                L6_1 = 1
                                                                                L7_1 = true
                                                                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                if L3_1 == 2 then
                                                                                  L3_1 = mp
                                                                                  L3_1 = L3_1.set_mpattribute
                                                                                  L4_1 = "LUA:TrueCryptVeraCrypt_Installer"
                                                                                  L3_1(L4_1)
                                                                                  L3_1 = mp
                                                                                  L3_1 = L3_1.INFECTED
                                                                                  return L3_1
                                                                                else
                                                                                  L3_1 = string
                                                                                  L3_1 = L3_1.find
                                                                                  L4_1 = L2_1
                                                                                  L5_1 = "ESIV"
                                                                                  L6_1 = 1
                                                                                  L7_1 = true
                                                                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                  if L3_1 == 1 then
                                                                                    L3_1 = mp
                                                                                    L3_1 = L3_1.set_mpattribute
                                                                                    L4_1 = "LUA:Vise_Installer"
                                                                                    L3_1(L4_1)
                                                                                    L3_1 = mp
                                                                                    L3_1 = L3_1.INFECTED
                                                                                    return L3_1
                                                                                  else
                                                                                    L3_1 = string
                                                                                    L3_1 = L3_1.find
                                                                                    L4_1 = L2_1
                                                                                    L5_1 = "NOS_PO"
                                                                                    L6_1 = 1
                                                                                    L7_1 = true
                                                                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                    if L3_1 ~= nil and L3_1 <= 6 and 1 <= L3_1 then
                                                                                      L4_1 = mp
                                                                                      L4_1 = L4_1.set_mpattribute
                                                                                      L5_1 = "LUA:NOS_Installer"
                                                                                      L4_1(L5_1)
                                                                                      L4_1 = mp
                                                                                      L4_1 = L4_1.INFECTED
                                                                                      return L4_1
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
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

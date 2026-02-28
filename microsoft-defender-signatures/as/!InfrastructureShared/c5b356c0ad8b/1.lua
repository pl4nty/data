local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "windows\\explorer.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\system32\\svchost.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\syswow64\\svchost.exe"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_39
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_39::
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[4]
          L3_1 = L3_1.utf8p2
          L2_1 = L2_1(L3_1)
          L1_1 = L2_1
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L2_1 = L2_1.utf8p2
          if L2_1 ~= nil then
            L2_1 = string
            L2_1 = L2_1.lower
            L3_1 = this_sigattrlog
            L3_1 = L3_1[5]
            L3_1 = L3_1.utf8p2
            L2_1 = L2_1(L3_1)
            L1_1 = L2_1
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L2_1 = L2_1.utf8p2
            if L2_1 ~= nil then
              L2_1 = string
              L2_1 = L2_1.lower
              L3_1 = this_sigattrlog
              L3_1 = L3_1[6]
              L3_1 = L3_1.utf8p2
              L2_1 = L2_1(L3_1)
              L1_1 = L2_1
          end
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[7]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[7]
              L2_1 = L2_1.utf8p2
              if L2_1 ~= nil then
                L2_1 = string
                L2_1 = L2_1.lower
                L3_1 = this_sigattrlog
                L3_1 = L3_1[7]
                L3_1 = L3_1.utf8p2
                L2_1 = L2_1(L3_1)
                L1_1 = L2_1
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = string
L2_1 = L2_1.len
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 < 4 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= "cmd" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "%1"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
else
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "cmd.exe"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "cmd "
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "powershell"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "schtasks"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "cscript"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "wscript"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L1_1
              L4_1 = "mshta"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L1_1
                L4_1 = "reg add"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L1_1
                  L4_1 = "reg.exe add"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if not L2_1 then
                    L2_1 = string
                    L2_1 = L2_1.find
                    L3_1 = L1_1
                    L4_1 = "regedit.exe"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if not L2_1 then
                      L2_1 = string
                      L2_1 = L2_1.find
                      L3_1 = L1_1
                      L4_1 = "bypass"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if not L2_1 then
                        L2_1 = string
                        L2_1 = L2_1.find
                        L3_1 = L1_1
                        L4_1 = "\\appdata\\roaming\\"
                        L5_1 = 1
                        L6_1 = true
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if not L2_1 then
                          L2_1 = string
                          L2_1 = L2_1.find
                          L3_1 = L1_1
                          L4_1 = "\\appdata\\local\\"
                          L5_1 = 1
                          L6_1 = true
                          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                          if not L2_1 then
                            L2_1 = string
                            L2_1 = L2_1.find
                            L3_1 = L1_1
                            L4_1 = "\\users\\public\\"
                            L5_1 = 1
                            L6_1 = true
                            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                            if not L2_1 then
                              L2_1 = string
                              L2_1 = L2_1.find
                              L3_1 = L1_1
                              L4_1 = "\\programdata\\"
                              L5_1 = 1
                              L6_1 = true
                              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                              if not L2_1 then
                                L2_1 = string
                                L2_1 = L2_1.find
                                L3_1 = L1_1
                                L4_1 = "vssadmin.exe"
                                L5_1 = 1
                                L6_1 = true
                                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                                if not L2_1 then
                                  L2_1 = string
                                  L2_1 = L2_1.find
                                  L3_1 = L1_1
                                  L4_1 = "%.bat$"
                                  L2_1 = L2_1(L3_1, L4_1)
                                  if not L2_1 then
                                    L2_1 = string
                                    L2_1 = L2_1.find
                                    L3_1 = L1_1
                                    L4_1 = "%.cmd$"
                                    L2_1 = L2_1(L3_1, L4_1)
                                    if not L2_1 then
                                      L2_1 = string
                                      L2_1 = L2_1.find
                                      L3_1 = L1_1
                                      L4_1 = "%.js$"
                                      L2_1 = L2_1(L3_1, L4_1)
                                      if not L2_1 then
                                        L2_1 = string
                                        L2_1 = L2_1.find
                                        L3_1 = L1_1
                                        L4_1 = "%.vbs$"
                                        L2_1 = L2_1(L3_1, L4_1)
                                        if not L2_1 then
                                          L2_1 = string
                                          L2_1 = L2_1.find
                                          L3_1 = L1_1
                                          L4_1 = "%.wsf$"
                                          L2_1 = L2_1(L3_1, L4_1)
                                          if not L2_1 and L1_1 ~= "cmd" then
                                            goto lbl_382
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
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = "BM"
  L4_1 = "T1548.002"
  L5_1 = "uac_bypass_src"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_382::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

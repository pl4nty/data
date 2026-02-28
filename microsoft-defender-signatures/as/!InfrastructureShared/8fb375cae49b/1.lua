local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.lower
    L1_1 = MpCommon
    L1_1 = L1_1.PathToWin32Path
    L2_1 = bm
    L2_1 = L2_1.get_imagepath
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1()
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "^c:\\"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "^\\\\"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
    end
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\program files"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "regsvr32.exe"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "rundll32.exe"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "svchost.exe"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "onedrive"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "\\google"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "msiexec.exe"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if not L1_1 then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "\\yandex"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if not L1_1 then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "dllhost.exe"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if not L1_1 then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "\\mail.ru"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if not L1_1 then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "\\steamapps\\"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if not L1_1 then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "\\local\\temp\\rar$"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if not L1_1 then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "\\local\\temp\\is-"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if not L1_1 then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "\\local\\temp\\ns"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if not L1_1 then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "\\local\\temp\\7z"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if not L1_1 then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "service.exe"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if not L1_1 then
                                    goto lbl_184
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
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    do return L1_1 end
    ::lbl_184::
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    L2_1 = sysio
    L2_1 = L2_1.IsFileExists
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "program files"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = ".ocx"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          goto lbl_218
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_218::
      L3_1 = mp
      L3_1 = L3_1.IsKnownFriendlyFile
      L4_1 = L1_1
      L5_1 = true
      L6_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == false then
        L3_1 = bm
        L3_1 = L3_1.add_related_file
        L4_1 = L1_1
        L3_1(L4_1)
        L3_1 = versioning
        L3_1 = L3_1.IsSeville
        L3_1 = L3_1()
        if L3_1 then
          L3_1 = versioning
          L3_1 = L3_1.GetCloudBlockLevel
          L3_1 = L3_1()
          if 4 <= L3_1 then
            L3_1 = TrackPidAndTechniqueBM
            L4_1 = "BM"
            L5_1 = "T1559.001"
            L6_1 = "interprocess_com_a"
            L3_1(L4_1, L5_1, L6_1)
          end
        end
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

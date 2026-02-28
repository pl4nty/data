local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.integrity_level
L2_1 = MpCommon
L2_1 = L2_1.SECURITY_MANDATORY_MEDIUM_RID
if L1_1 > L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.GetProcessElevationAndIntegrityLevel
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = L1_1.IntegrityLevel
L3_1 = MpCommon
L3_1 = L3_1.SECURITY_MANDATORY_MEDIUM_RID
if L2_1 > L3_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
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
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = bm
    L4_1 = L4_1.get_imagepath
    L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1()
    L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\program files"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "regsvr32.exe"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "rundll32.exe"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L2_1
          L5_1 = "svchost.exe"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L2_1
            L5_1 = "onedrive"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.find
              L4_1 = L2_1
              L5_1 = "\\google"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L3_1 = string
                L3_1 = L3_1.find
                L4_1 = L2_1
                L5_1 = "msiexec.exe"
                L6_1 = 1
                L7_1 = true
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  L3_1 = string
                  L3_1 = L3_1.find
                  L4_1 = L2_1
                  L5_1 = "\\yandex"
                  L6_1 = 1
                  L7_1 = true
                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                  if not L3_1 then
                    L3_1 = string
                    L3_1 = L3_1.find
                    L4_1 = L2_1
                    L5_1 = "dllhost.exe"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if not L3_1 then
                      L3_1 = string
                      L3_1 = L3_1.find
                      L4_1 = L2_1
                      L5_1 = "\\mail.ru"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if not L3_1 then
                        L3_1 = string
                        L3_1 = L3_1.find
                        L4_1 = L2_1
                        L5_1 = "\\steamapps\\"
                        L6_1 = 1
                        L7_1 = true
                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                        if not L3_1 then
                          L3_1 = string
                          L3_1 = L3_1.find
                          L4_1 = L2_1
                          L5_1 = "service.exe"
                          L6_1 = 1
                          L7_1 = true
                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                          if not L3_1 then
                            goto lbl_154
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
    ::lbl_154::
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    L4_1 = sysio
    L4_1 = L4_1.IsFileExists
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "program files"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = ".ocx"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          goto lbl_188
        end
      end
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      do return L5_1 end
      ::lbl_188::
      L5_1 = mp
      L5_1 = L5_1.IsKnownFriendlyFile
      L6_1 = L3_1
      L7_1 = true
      L8_1 = false
      L5_1 = L5_1(L6_1, L7_1, L8_1)
      if L5_1 == false then
        L5_1 = bm
        L5_1 = L5_1.add_related_file
        L6_1 = L3_1
        L5_1(L6_1)
        L5_1 = versioning
        L5_1 = L5_1.IsSeville
        L5_1 = L5_1()
        if L5_1 then
          L5_1 = versioning
          L5_1 = L5_1.GetCloudBlockLevel
          L5_1 = L5_1()
          if 4 <= L5_1 then
            L5_1 = TrackPidAndTechniqueBM
            L6_1 = "BM"
            L7_1 = "T1559.001"
            L8_1 = "interprocess_com_b"
            L5_1(L6_1, L7_1, L8_1)
          end
        end
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

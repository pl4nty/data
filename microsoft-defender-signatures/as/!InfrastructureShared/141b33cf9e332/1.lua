local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = string
        L0_1 = L0_1.lower
        L1_1 = bm
        L1_1 = L1_1.get_imagepath
        L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1()
        L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
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
                    L3_1 = "service.exe"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if not L1_1 then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "coresynccustomhook"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if not L1_1 then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "frxsvc"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if not L1_1 then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "integrator"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if not L1_1 then
                            goto lbl_120
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
        ::lbl_120::
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[2]
        L2_1 = L2_1.utf8p1
        L1_1 = L1_1(L2_1)
        L2_1 = this_sigattrlog
        L2_1 = L2_1[2]
        L2_1 = L2_1.utf8p2
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L4_1 = L4_1.utf8p2
        L3_1 = L3_1(L4_1)
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L1_1
        L6_1 = L3_1
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 then
          L4_1 = sysio
          L4_1 = L4_1.IsFileExists
          L5_1 = L2_1
          L4_1 = L4_1(L5_1)
          if L4_1 then
            L4_1 = string
            L4_1 = L4_1.lower
            L5_1 = L2_1
            L4_1 = L4_1(L5_1)
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = "\\program files"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L4_1
              L7_1 = "\\windows\\"
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                goto lbl_175
              end
            end
            L5_1 = mp
            L5_1 = L5_1.CLEAN
            do return L5_1 end
            ::lbl_175::
            L5_1 = mp
            L5_1 = L5_1.IsKnownFriendlyFile
            L6_1 = L2_1
            L7_1 = true
            L8_1 = false
            L5_1 = L5_1(L6_1, L7_1, L8_1)
            if L5_1 == false then
              L5_1 = bm
              L5_1 = L5_1.add_related_file
              L6_1 = L2_1
              L5_1(L6_1)
              L5_1 = TrackPidAndTechniqueBM
              L6_1 = "BM"
              L7_1 = "T1559.001"
              L8_1 = "interprocess_com_d"
              L5_1(L6_1, L7_1, L8_1)
              L5_1 = mp
              L5_1 = L5_1.INFECTED
              return L5_1
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

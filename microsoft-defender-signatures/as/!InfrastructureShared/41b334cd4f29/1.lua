local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = bm
    L0_1 = L0_1.get_process_relationships
    L0_1, L1_1 = L0_1()
    L2_1 = ipairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = L6_1.image_path
      if L7_1 ~= nil then
        L7_1 = L6_1.ppid
        if L7_1 ~= nil then
          L7_1 = string
          L7_1 = L7_1.find
          L8_1 = string
          L8_1 = L8_1.lower
          L9_1 = L6_1.image_path
          L8_1 = L8_1(L9_1)
          L9_1 = "\\rundll32.exe"
          L10_1 = 1
          L11_1 = true
          L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
          if L7_1 then
            L7_1 = TrackPidAndTechniqueBM
            L8_1 = L6_1.ppid
            L9_1 = "T1218.011"
            L10_1 = "Proxy_Exec"
            L7_1(L8_1, L9_1, L10_1)
            L7_1 = extractDllForRegproc
            L8_1 = L6_1.cmd_line
            L7_1 = L7_1(L8_1)
            if L7_1 then
              L8_1 = mp
              L8_1 = L8_1.ContextualExpandEnvironmentVariables
              L9_1 = L7_1
              L8_1 = L8_1(L9_1)
              L7_1 = L8_1
              L8_1 = sysio
              L8_1 = L8_1.IsFileExists
              L9_1 = L7_1
              L8_1 = L8_1(L9_1)
              if L8_1 then
                L8_1 = sysio
                L8_1 = L8_1.GetFileLastWriteTime
                L9_1 = L7_1
                L8_1 = L8_1(L9_1)
                L9_1 = sysio
                L9_1 = L9_1.GetLastResult
                L9_1 = L9_1()
                L9_1 = L9_1.Success
                if L9_1 and L8_1 ~= 0 then
                  L9_1 = L8_1 / 10000000
                  L8_1 = L9_1 - 11644473600
                  L9_1 = MpCommon
                  L9_1 = L9_1.GetCurrentTimeT
                  L9_1 = L9_1()
                  if not (L8_1 > L9_1) then
                    L10_1 = L9_1 - L8_1
                    if not (3600 < L10_1) then
                      goto lbl_91
                    end
                  end
                  L10_1 = bm
                  L10_1 = L10_1.add_related_file
                  L11_1 = L7_1
                  L10_1(L11_1)
                  L10_1 = IsDetectionThresholdMet
                  L11_1 = "BM"
                  L10_1 = L10_1(L11_1)
                  if L10_1 then
                    L10_1 = mp
                    L10_1 = L10_1.INFECTED
                    return L10_1
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_91::
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

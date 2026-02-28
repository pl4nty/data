local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = L0_1.image_path
  if L1_1 then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = -8
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if L3_1 == "w3wp.exe" then
        L3_1 = L0_1.ppid
        L4_1 = isnull
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = mp
        L4_1 = L4_1.GetProcessCommandLine
        L5_1 = L3_1
        L4_1 = L4_1(L5_1)
        L5_1 = isnull
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        if L5_1 then
          L5_1 = mp
          L5_1 = L5_1.CLEAN
          return L5_1
        end
        L5_1 = string
        L5_1 = L5_1.lower
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        L4_1 = L5_1
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = "-ap \"msexchangeecpapppool\""
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L4_1
          L7_1 = "-ap \"msexchangeowaapppool\""
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = "-ap \"msexchangeoabapppool\""
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L4_1
              L7_1 = "-ap \"msexchangeowacalendarapppool\""
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                L5_1 = string
                L5_1 = L5_1.find
                L6_1 = L4_1
                L7_1 = "-ap \"msexchangeservicesapppool\""
                L8_1 = 1
                L9_1 = true
                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                if not L5_1 then
                  L5_1 = string
                  L5_1 = L5_1.find
                  L6_1 = L4_1
                  L7_1 = "-ap \"msexchangeautodiscoverapppool\""
                  L8_1 = 1
                  L9_1 = true
                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                  if not L5_1 then
                    L5_1 = string
                    L5_1 = L5_1.find
                    L6_1 = L4_1
                    L7_1 = "-ap \"msexchangemapifrontendapppool\""
                    L8_1 = 1
                    L9_1 = true
                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                    if not L5_1 then
                      goto lbl_123
                    end
                  end
                end
              end
            end
          end
        end
        L5_1 = TrackPidAndTechnique
        L6_1 = L3_1
        L7_1 = "T1505.003"
        L8_1 = "webshell_parent"
        L9_1 = 604800
        L5_1(L6_1, L7_1, L8_1, L9_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        do return L5_1 end
        ::lbl_123::
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = "-ap \"msexchangepowershellapppool\""
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if L5_1 then
          L5_1 = mp
          L5_1 = L5_1.GetScannedPPID
          L5_1 = L5_1()
          L6_1 = MpCommon
          L6_1 = L6_1.GetProcessElevationAndIntegrityLevel
          L7_1 = L5_1
          L6_1 = L6_1(L7_1)
          if L6_1 then
            L7_1 = L6_1.IntegrityLevel
            L8_1 = MpCommon
            L8_1 = L8_1.SECURITY_MANDATORY_SYSTEM_RID
            if L7_1 >= L8_1 then
              L7_1 = TrackPidAndTechnique
              L8_1 = L3_1
              L9_1 = "T1505.003"
              L10_1 = "webshell_parent"
              L11_1 = 604800
              L7_1(L8_1, L9_1, L10_1, L11_1)
              L7_1 = mp
              L7_1 = L7_1.INFECTED
              return L7_1
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

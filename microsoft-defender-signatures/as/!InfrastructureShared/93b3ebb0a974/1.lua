local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= nil then
      L0_1 = string
      L0_1 = L0_1.lower
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L1_1 = L1_1.utf8p1
      L0_1 = L0_1(L1_1)
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L2_1 = bm
      L2_1 = L2_1.get_current_process_startup_info
      L2_1 = L2_1()
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1.command_line
      L3_1 = L3_1(L4_1)
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "\\program files\\"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "srtasks.exe"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = "rstrui.exe"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "executescheduledsppcreation"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L3_1
              L6_1 = "wbengine.exe"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                L4_1 = string
                L4_1 = L4_1.find
                L5_1 = L3_1
                L6_1 = "veeam"
                L7_1 = 1
                L8_1 = true
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if not L4_1 then
                  L4_1 = string
                  L4_1 = L4_1.find
                  L5_1 = L3_1
                  L6_1 = "beremote"
                  L7_1 = 1
                  L8_1 = true
                  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                  if not L4_1 then
                    goto lbl_101
                  end
                end
              end
            end
          end
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      do return L4_1 end
      ::lbl_101::
      L4_1 = StringEndsWith
      L5_1 = L0_1
      L6_1 = "\\security"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = StringStartsWith
        L5_1 = L1_1
        L6_1 = "\\\\.\\"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L4_1 = StringStartsWith
          L5_1 = L1_1
          L6_1 = "\\\\?\\"
          L4_1 = L4_1(L5_1, L6_1)
          if not L4_1 then
            L5_1 = L1_1
            L4_1 = L1_1.find
            L6_1 = "\\device\\"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L5_1 = L1_1
              L4_1 = L1_1.find
              L6_1 = "\\volume{"
              L7_1 = 1
              L8_1 = true
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                goto lbl_141
              end
            end
          end
        end
        L4_1 = pcall
        L5_1 = MpCommon
        L5_1 = L5_1.PathToWin32Path
        L6_1 = L1_1
        L4_1, L5_1 = L4_1(L5_1, L6_1)
        L1_1 = L5_1
        _ = L4_1
        goto lbl_154
        ::lbl_141::
        L4_1 = StringStartsWith
        L5_1 = L1_1
        L6_1 = "%"
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 then
          L4_1 = pcall
          L5_1 = mp
          L5_1 = L5_1.ContextualExpandEnvironmentVariables
          L6_1 = L1_1
          L4_1, L5_1 = L4_1(L5_1, L6_1)
          L1_1 = L5_1
          _ = L4_1
        end
        ::lbl_154::
        if L1_1 ~= nil then
          L5_1 = L1_1
          L4_1 = L1_1.match
          L6_1 = "^\\\\(.-)\\(.+)$"
          L4_1, L5_1 = L4_1(L5_1, L6_1)
          if L4_1 ~= nil and L5_1 ~= nil then
            L6_1 = StringStartsWith
            L7_1 = L5_1
            L8_1 = "c$\\"
            L6_1 = L6_1(L7_1, L8_1)
            if not L6_1 then
              L6_1 = StringStartsWith
              L7_1 = L5_1
              L8_1 = "admin$\\"
              L6_1 = L6_1(L7_1, L8_1)
              if not L6_1 then
                goto lbl_180
              end
            end
            L6_1 = AddPidSpecificTechniqueAndTactic
            L7_1 = "BM"
            L8_1 = "T1021.002"
            L9_1 = "sechiveexfil_to_adminshares"
            L6_1(L7_1, L8_1, L9_1)
            ::lbl_180::
            L6_1 = AddPidSpecificTechniqueAndTactic
            L7_1 = "BM"
            L8_1 = "T1020"
            L9_1 = "exfil_to_networkshare"
            L6_1(L7_1, L8_1, L9_1)
            L6_1 = AppendToRollingQueue
            L7_1 = "SuspExfilServer"
            L8_1 = L4_1
            L9_1 = nil
            L10_1 = 5000
            L6_1(L7_1, L8_1, L9_1, L10_1)
          end
          L6_1 = AppendToRollingQueue
          L7_1 = "SuspSyshiveExfilPath"
          L8_1 = L1_1
          L9_1 = nil
          L10_1 = 5000
          L6_1(L7_1, L8_1, L9_1, L10_1)
          L6_1 = TrackPidAndTechniqueBM
          L7_1 = "BM"
          L8_1 = "T1003.002"
          L9_1 = "sechiveexfil_from_shadowcopy"
          L6_1(L7_1, L8_1, L9_1)
          L6_1 = mp
          L6_1 = L6_1.INFECTED
          return L6_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

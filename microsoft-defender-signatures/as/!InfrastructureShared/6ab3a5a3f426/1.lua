local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= nil then
      L0_1 = string
      L0_1 = L0_1.lower
      L1_1 = this_sigattrlog
      L1_1 = L1_1[1]
      L1_1 = L1_1.utf8p1
      L0_1 = L0_1(L1_1)
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = this_sigattrlog
      L2_1 = L2_1[1]
      L2_1 = L2_1.utf8p2
      L1_1 = L1_1(L2_1)
      L2_1 = StringEndsWith
      L3_1 = L0_1
      L4_1 = "\\ntds.dit"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = StringStartsWith
        L3_1 = L1_1
        L4_1 = "\\\\.\\"
        L2_1 = L2_1(L3_1, L4_1)
        if not L2_1 then
          L2_1 = StringStartsWith
          L3_1 = L1_1
          L4_1 = "\\\\?\\"
          L2_1 = L2_1(L3_1, L4_1)
          if not L2_1 then
            L3_1 = L1_1
            L2_1 = L1_1.find
            L4_1 = "\\device\\"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L3_1 = L1_1
              L2_1 = L1_1.find
              L4_1 = "\\volume{"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                goto lbl_68
              end
            end
          end
        end
        L2_1 = pcall
        L3_1 = MpCommon
        L3_1 = L3_1.PathToWin32Path
        L4_1 = L1_1
        L2_1, L3_1 = L2_1(L3_1, L4_1)
        L1_1 = L3_1
        _ = L2_1
        goto lbl_81
        ::lbl_68::
        L2_1 = StringStartsWith
        L3_1 = L1_1
        L4_1 = "%"
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 then
          L2_1 = pcall
          L3_1 = mp
          L3_1 = L3_1.ContextualExpandEnvironmentVariables
          L4_1 = L1_1
          L2_1, L3_1 = L2_1(L3_1, L4_1)
          L1_1 = L3_1
          _ = L2_1
        end
        ::lbl_81::
        if L1_1 ~= nil then
          L3_1 = L1_1
          L2_1 = L1_1.match
          L4_1 = "^\\\\(.-)\\(.+)$"
          L2_1, L3_1 = L2_1(L3_1, L4_1)
          if L2_1 ~= nil and L3_1 ~= nil then
            L4_1 = StringStartsWith
            L5_1 = L3_1
            L6_1 = "c$\\"
            L4_1 = L4_1(L5_1, L6_1)
            if not L4_1 then
              L4_1 = StringStartsWith
              L5_1 = L3_1
              L6_1 = "admin$\\"
              L4_1 = L4_1(L5_1, L6_1)
              if not L4_1 then
                goto lbl_107
              end
            end
            L4_1 = AddPidSpecificTechniqueAndTactic
            L5_1 = "BM"
            L6_1 = "T1021.002"
            L7_1 = "ntdsexfil_to_adminshares"
            L4_1(L5_1, L6_1, L7_1)
            ::lbl_107::
            L4_1 = AddPidSpecificTechniqueAndTactic
            L5_1 = "BM"
            L6_1 = "T1020"
            L7_1 = "exfil_to_networkshare"
            L4_1(L5_1, L6_1, L7_1)
            L4_1 = AppendToRollingQueue
            L5_1 = "SuspExfilServer"
            L6_1 = L2_1
            L7_1 = nil
            L8_1 = 5000
            L4_1(L5_1, L6_1, L7_1, L8_1)
          end
          L4_1 = AppendToRollingQueue
          L5_1 = "SuspNtdsExfilPath"
          L6_1 = L1_1
          L7_1 = nil
          L8_1 = 5000
          L4_1(L5_1, L6_1, L7_1, L8_1)
          L4_1 = TrackPidAndTechniqueBM
          L5_1 = "BM"
          L6_1 = "T1003.003"
          L7_1 = "ntdsexfil_from_shadowcopy"
          L4_1(L5_1, L6_1, L7_1)
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[7]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[7]
    L0_1 = L0_1.utf8p2
    if L0_1 ~= nil then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[7]
      L0_1 = L0_1.utf8p1
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "<Command>(.*)</Command>"
      L1_1 = L1_1(L2_1, L3_1)
      L2_1 = string
      L2_1 = L2_1.match
      L3_1 = L0_1
      L4_1 = "<Arguments>(.*)</Arguments>"
      L2_1 = L2_1(L3_1, L4_1)
      if L1_1 ~= nil then
        if L2_1 ~= nil then
          L3_1 = L1_1
          L4_1 = " "
          L5_1 = L2_1
          L1_1 = L3_1 .. L4_1 .. L5_1
        end
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "windowsdefenderatponboardingscript.cmd"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\sysvol\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\netlogon\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "windows\\ccm"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "config.xml"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
        L3_1 = TrackCommandLineAndTechnique
        L4_1 = L1_1
        L5_1 = "T1053.005:schtask_target"
        L3_1(L4_1, L5_1)
        L3_1 = mp
        L3_1 = L3_1.IsHipsRuleEnabled
        L4_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          L3_1 = IsDetectionThresholdMet
          L4_1 = "BM"
          L3_1 = L3_1(L4_1)
          if not L3_1 then
            goto lbl_116
          end
        end
        L3_1 = bm_AddRelatedFileFromCommandLine
        L4_1 = L1_1
        L5_1 = nil
        L6_1 = nil
        L7_1 = 1
        L3_1(L4_1, L5_1, L6_1, L7_1)
        L3_1 = AddResearchData
        L4_1 = this_sigattrlog
        L4_1 = L4_1[7]
        L4_1 = L4_1.ppid
        L5_1 = true
        L3_1(L4_1, L5_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
::lbl_116::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

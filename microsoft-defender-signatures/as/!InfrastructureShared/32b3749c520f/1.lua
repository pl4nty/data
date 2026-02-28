local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "(.*)|(.*)"
    L1_1, L2_1 = L1_1(L2_1, L3_1)
    if L1_1 and L2_1 then
      L3_1 = bm
      L3_1 = L3_1.add_related_string
      L4_1 = "serverName"
      L5_1 = L1_1
      L6_1 = bm
      L6_1 = L6_1.RelatedStringBMReport
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = bm
      L3_1 = L3_1.add_related_string
      L4_1 = "tamperingAlert"
      L5_1 = L2_1
      L6_1 = bm
      L6_1 = L6_1.RelatedStringBMReport
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = bm
      L3_1 = L3_1.get_current_process_startup_info
      L3_1 = L3_1()
      if L3_1 then
        L4_1 = bm
        L4_1 = L4_1.add_related_string
        L5_1 = "appName"
        L6_1 = getWebApplicationType
        L7_1 = L3_1.ppid
        L6_1 = L6_1(L7_1)
        L7_1 = bm
        L7_1 = L7_1.RelatedStringBMReport
        L4_1(L5_1, L6_1, L7_1)
      end
      L4_1 = reportSessionInformationInclusive
      L4_1()
      L4_1 = bm_AddRelatedFileFromCommandLine
      L5_1 = "bm"
      L4_1(L5_1)
      L4_1 = add_parents
      L4_1()
      L4_1 = 30
      L5_1 = "PFServers"
      L6_1 = GetPidFromParentImagePath
      L7_1 = L1_1
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L7_1 = startTrackingApp
        L8_1 = L6_1
        L9_1 = L1_1
        L10_1 = L5_1
        L11_1 = "PFApp_Parent"
        L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if not L7_1 then
          L8_1.SignatureName = "PFATamper.C"
          L8_1.ProcessName = L1_1
          L9_1 = bm
          L9_1 = L9_1.trigger_sig
          L10_1 = "ProcAttribError"
          L11_1 = safeJsonSerialize
          L12_1 = L8_1
          L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1)
          L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
        else
          L9_1 = "Tampering["
          L10_1 = L3_1.ppid
          L11_1 = L10_1
          L10_1 = L10_1.match
          L12_1 = "pid:(%d+)"
          L10_1 = L10_1(L11_1, L12_1)
          L11_1 = "]["
          L12_1 = L2_1
          L13_1 = "]"
          L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
          L10_1 = IncreaseProcessAnomalyScore
          L11_1 = L3_1.ppid
          L12_1 = L4_1
          L13_1 = L9_1
          L14_1 = "PFApp_Parent"
          L10_1(L11_1, L12_1, L13_1, L14_1)
          L10_1 = next
          L11_1 = L8_1
          L10_1 = L10_1(L11_1)
          if L10_1 then
            L10_1 = L8_1.IsNewApp
            if L10_1 then
              L8_1.SignatureName = "PFATamper.C"
              L8_1.ProcessName = L1_1
              L8_1.Score = L4_1
              L10_1 = bm
              L10_1 = L10_1.trigger_sig
              L11_1 = "SetProcessAttrib"
              L12_1 = safeJsonSerialize
              L13_1 = L8_1
              L12_1, L13_1, L14_1 = L12_1(L13_1)
              L10_1(L11_1, L12_1, L13_1, L14_1)
            end
          end
        end
      end
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

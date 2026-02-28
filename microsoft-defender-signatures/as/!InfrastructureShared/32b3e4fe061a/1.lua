local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
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
      L4_1 = 10
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
          L8_1.SignatureName = "PFATamper.B"
          L8_1.ProcessName = L1_1
          L9_1 = bm
          L9_1 = L9_1.trigger_sig
          L10_1 = "ProcAttribError"
          L11_1 = safeJsonSerialize
          L12_1 = L8_1
          L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L11_1(L12_1)
          L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
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
          L11_1 = L6_1
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
              L8_1.SignatureName = "PFATamper.B"
              L8_1.ProcessName = L1_1
              L8_1.Score = L4_1
              L10_1 = bm
              L10_1 = L10_1.trigger_sig
              L11_1 = "SetProcessAttrib"
              L12_1 = safeJsonSerialize
              L13_1 = L8_1
              L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L12_1(L13_1)
              L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
            end
          end
        end
      end
      L7_1 = {}
      L7_1["cmd.exe"] = true
      L7_1["powershell.exe"] = true
      L7_1["reg.exe"] = true
      L8_1 = {}
      L8_1.serverName = L1_1
      L8_1.tamperingAlert = L2_1
      L8_1.signame = "PFATamper.B"
      L9_1 = bm
      L9_1 = L9_1.get_current_process_startup_info
      L9_1 = L9_1()
      if L9_1 then
        L10_1 = L9_1.ppid
        if L10_1 then
          L10_1 = L9_1.image_path
          if L10_1 then
            L10_1 = L9_1.image_path
            L11_1 = L10_1.match
            L12_1 = "([^\\]+)$"
            L11_1 = L11_1(L12_1)
            L10_1 = L11_1
            if L10_1 then
              L11_1 = string
              L11_1 = L11_1.lower
              L12_1 = L10_1
              L11_1 = L11_1(L12_1)
              L11_1 = L7_1[L11_1]
              if L11_1 then
                L11_1 = bm
                L11_1 = L11_1.trigger_sig
                L12_1 = "PFATamper_Remediate"
                L13_1 = safeJsonSerialize
                L14_1 = L8_1
                L13_1, L14_1, L15_1, L16_1, L17_1, L18_1 = L13_1(L14_1)
                L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1)
                L11_1 = mp
                L11_1 = L11_1.INFECTED
                return L11_1
              end
            end
          end
        end
      end
      L10_1 = hasBase64encodedParent
      L11_1 = L3_1.ppid
      L10_1, L11_1, L12_1 = L10_1(L11_1)
      if L10_1 then
        L8_1.base64Cmdline = L12_1
        L8_1.base64parentImagePath = L11_1
        L13_1 = bm
        L13_1 = L13_1.trigger_sig
        L14_1 = "PFATamper_To_Remediate"
        L15_1 = safeJsonSerialize
        L16_1 = L8_1
        L15_1, L16_1, L17_1, L18_1 = L15_1(L16_1)
        L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
        L13_1 = mp
        L13_1 = L13_1.INFECTED
        return L13_1
      end
      L13_1 = {}
      L14_1 = {}
      L15_1 = "reg"
      L16_1 = "disable"
      L14_1[1] = L15_1
      L14_1[2] = L16_1
      L13_1[1] = L14_1
      L14_1 = mp
      L14_1 = L14_1.GetProcessCommandLine
      L15_1 = L3_1.ppid
      L14_1 = L14_1(L15_1)
      if L14_1 then
        L15_1 = contains
        L16_1 = L14_1
        L17_1 = {}
        L18_1 = "reg.*disable"
        L17_1[1] = L18_1
        L18_1 = false
        L15_1 = L15_1(L16_1, L17_1, L18_1)
        if L15_1 then
          goto lbl_202
        end
      end
      L15_1 = checkParentCmdlineCaseInsensitive
      L16_1 = L3_1.ppid
      L17_1 = L13_1
      L18_1 = 3
      L15_1 = L15_1(L16_1, L17_1, L18_1)
      ::lbl_202::
      if L15_1 then
        L15_1 = bm
        L15_1 = L15_1.trigger_sig
        L16_1 = "PFATamper_To_Remediate"
        L17_1 = safeJsonSerialize
        L18_1 = L8_1
        L17_1, L18_1 = L17_1(L18_1)
        L15_1(L16_1, L17_1, L18_1)
        L15_1 = mp
        L15_1 = L15_1.INFECTED
        return L15_1
      end
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1

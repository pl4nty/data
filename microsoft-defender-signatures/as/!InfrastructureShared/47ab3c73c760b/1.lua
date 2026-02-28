local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = false
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = "httpd.exe"
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.utf8p1
    L3_1 = L2_1
    L2_1 = L2_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    L1_1 = L2_1
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.matched
    if L2_1 then
      L1_1 = "nginx.exe"
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L2_1 = L2_1.matched
      if L2_1 then
        L1_1 = "w3wp.exe"
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[9]
        L2_1 = L2_1.matched
        if L2_1 then
          L1_1 = "sqlservr.exe"
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[10]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[10]
            L2_1 = L2_1.utf8p1
            L3_1 = L2_1
            L2_1 = L2_1.match
            L4_1 = "([^\\]+)$"
            L2_1 = L2_1(L3_1, L4_1)
            L1_1 = L2_1
          end
        end
      end
    end
  end
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 then
  L3_1 = L2_1.ppid
  if L3_1 then
    L3_1 = MpCommon
    L3_1 = L3_1.GetProcessAttributeValue
    L4_1 = L2_1.ppid
    L5_1 = "inherit:PFApp_Parent"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = MpCommon
      L3_1 = L3_1.GetProcessAttributeValue
      L4_1 = L2_1.ppid
      L5_1 = "PFApp_Parent"
      L3_1 = L3_1(L4_1, L5_1)
    end
    if L3_1 then
      L4_1 = bm
      L4_1 = L4_1.add_related_string
      L5_1 = "procAttrib"
      L6_1 = L3_1
      L7_1 = bm
      L7_1 = L7_1.RelatedStringBMReport
      L4_1(L5_1, L6_1, L7_1)
    end
  end
end
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[11]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[11]
  L3_1 = L4_1.utf8p1
  L4_1 = {}
  L5_1 = "Behavior:Win32/MpTamperEx.B"
  L6_1 = "Behavior:Win32/MuprocMpTamperPreference.gen!A"
  L7_1 = "Behavior:Win32/MpTamperRTP.C"
  L8_1 = "Behavior:Win32/MpTamperGpDisableAV.A"
  L9_1 = "Behavior:Win32/MpTamperSrvDisableAV.B"
  L10_1 = "Behavior:Win32/MpTamperRTP.D"
  L11_1 = "Behavior:Win32/MpTamperSrv.A"
  L12_1 = "Behavior:Win32/MpTamperPShell.A"
  L13_1 = "Behavior:Win32/MpTamperGpDisableAVFriendly.A"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L4_1[4] = L8_1
  L4_1[5] = L9_1
  L4_1[6] = L10_1
  L4_1[7] = L11_1
  L4_1[8] = L12_1
  L4_1[9] = L13_1
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = string
    L10_1 = L10_1.find
    L11_1 = L3_1
    L12_1 = L9_1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 then
      L0_1 = true
      break
    end
  end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[12]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[12]
    L3_1 = L4_1.utf8p1
    L0_1 = true
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[13]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[13]
      L3_1 = L4_1.utf8p2
      L4_1 = {}
      L5_1 = "Trojan:Win32/MpTamperSrvDisableAV.D"
      L6_1 = "Trojan:Win32/MpTamperSrvDisableAV.H"
      L7_1 = "Trojan:Win32/MpTamperSrvDisableAV.I"
      L8_1 = "Trojan:Win32/MpTamperSrvDisableAV.J"
      L9_1 = "Trojan:Win32/MpTamperSrvDisableAV.K"
      L10_1 = "Trojan:Win32/MpTamperSrvDisableAV.L"
      L11_1 = "Trojan:Win32/MpTamperDisableFeatureWd.A"
      L12_1 = "Trojan:Win32/MpTamperDisableFeatureWd.B"
      L13_1 = "Trojan:Win32/MPTamperAdRun.B"
      L14_1 = "Trojan:Win32/MpTamperRegDisableAV.SA"
      L15_1 = "Trojan:Win32/MPTamperSuspExlc.C"
      L4_1[1] = L5_1
      L4_1[2] = L6_1
      L4_1[3] = L7_1
      L4_1[4] = L8_1
      L4_1[5] = L9_1
      L4_1[6] = L10_1
      L4_1[7] = L11_1
      L4_1[8] = L12_1
      L4_1[9] = L13_1
      L4_1[10] = L14_1
      L4_1[11] = L15_1
      L5_1 = ipairs
      L6_1 = L4_1
      L5_1, L6_1, L7_1 = L5_1(L6_1)
      for L8_1, L9_1 in L5_1, L6_1, L7_1 do
        L10_1 = string
        L10_1 = L10_1.find
        L11_1 = L3_1
        L12_1 = L9_1
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 then
          L0_1 = true
          break
        end
      end
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[14]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[14]
        L3_1 = L4_1.utf8p2
        L0_1 = true
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[15]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[15]
          L3_1 = L4_1.utf8p1
          L4_1 = MpCommon
          L4_1 = L4_1.StringRegExpSearch
          L5_1 = "(?i)(MpTamperBulkExcl|MPTamperSuspExlc.C|SrvDisableAV|DisableFeature)"
          L6_1 = L3_1
          L4_1 = L4_1(L5_1, L6_1)
          if L4_1 then
            L0_1 = true
          end
          L4_1 = this_sigattrlog
          L4_1 = L4_1[15]
          L4_1 = L4_1.utf8p2
          if L4_1 == "INFECTED" then
            L4_1 = bm
            L4_1 = L4_1.add_related_string
            L5_1 = "AMSI_Detection"
            L6_1 = L3_1
            L7_1 = "|"
            L8_1 = "INFECTED"
            L6_1 = L6_1 .. L7_1 .. L8_1
            L7_1 = bm
            L7_1 = L7_1.RelatedStringBMReport
            L4_1(L5_1, L6_1, L7_1)
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[15]
            L4_1 = L4_1.utf8p2
            if L4_1 == "LOFI" then
              L4_1 = bm
              L4_1 = L4_1.add_related_string
              L5_1 = "AMSI_Detection"
              L6_1 = L3_1
              L7_1 = "|"
              L8_1 = "LOFI"
              L6_1 = L6_1 .. L7_1 .. L8_1
              L7_1 = bm
              L7_1 = L7_1.RelatedStringBMReport
              L4_1(L5_1, L6_1, L7_1)
            end
          end
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[16]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[16]
            L3_1 = L4_1.utf8p1
            L0_1 = true
          else
            L4_1 = this_sigattrlog
            L4_1 = L4_1[17]
            L4_1 = L4_1.matched
            if L4_1 then
              L4_1 = this_sigattrlog
              L4_1 = L4_1[17]
              L3_1 = L4_1.utf8p1
              L0_1 = true
            else
              L4_1 = this_sigattrlog
              L4_1 = L4_1[18]
              L4_1 = L4_1.matched
              if L4_1 then
                L4_1 = this_sigattrlog
                L4_1 = L4_1[18]
                L3_1 = L4_1.utf8p1
                L0_1 = true
              end
            end
          end
        end
      end
    end
  end
end
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = "httpd"
  L4_2 = "w3wp"
  L5_2 = "sqlservr"
  L6_2 = "tomcat"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L3_2 = false
  L4_2 = ipairs
  L5_2 = L2_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = string
    L9_2 = L9_2.find
    L10_2 = A1_2
    L11_2 = L8_2
    L9_2 = L9_2(L10_2, L11_2)
    if L9_2 then
      L3_2 = true
      break
    end
  end
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = {}
  L5_2 = "php-cgi.exe"
  L6_2 = "httpd.exe"
  L7_2 = "tomcat"
  L8_2 = "nginx.exe"
  L9_2 = "w3wp.exe"
  L10_2 = "sqlservr.exe"
  L11_2 = "java"
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L4_2[7] = L11_2
  L5_2 = contains
  L6_2 = A0_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = true
  return L5_2
end

if L0_1 then
  L5_1 = 30
  if L5_1 then
    goto lbl_272
  end
end
L5_1 = 10
::lbl_272::
L6_1 = "PFServers"
L7_1 = GetPidFromParentImagePath
L8_1 = L1_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L8_1 = startTrackingApp
  L9_1 = L7_1
  L10_1 = L1_1
  L11_1 = L6_1
  L12_1 = "PFApp_Parent"
  L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if not L8_1 then
    L9_1.SignatureName = "PFATamper.A"
    L9_1.ProcessName = L1_1
    L10_1 = bm
    L10_1 = L10_1.trigger_sig
    L11_1 = "ProcAttribError"
    L12_1 = safeJsonSerialize
    L13_1 = L9_1
    L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1)
    L10_1(L11_1, L12_1, L13_1, L14_1, L15_1)
  else
    L10_1 = "Tampering["
    L11_1 = L2_1.ppid
    L12_1 = L11_1
    L11_1 = L11_1.match
    L13_1 = "pid:(%d+)"
    L11_1 = L11_1(L12_1, L13_1)
    L12_1 = "]["
    L13_1 = L3_1
    L14_1 = "]"
    L10_1 = L10_1 .. L11_1 .. L12_1 .. L13_1 .. L14_1
    L11_1 = IncreaseProcessAnomalyScore
    L12_1 = L2_1.ppid
    L13_1 = L5_1
    L14_1 = L10_1
    L15_1 = "PFApp_Parent"
    L11_1(L12_1, L13_1, L14_1, L15_1)
    L11_1 = next
    L12_1 = L9_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = L9_1.IsNewApp
      if L11_1 then
        L9_1.SignatureName = "PFATamper.A"
        L9_1.ProcessName = L1_1
        L9_1.Score = L5_1
        L11_1 = bm
        L11_1 = L11_1.trigger_sig
        L12_1 = "SetProcessAttrib"
        L13_1 = safeJsonSerialize
        L14_1 = L9_1
        L13_1, L14_1, L15_1 = L13_1(L14_1)
        L11_1(L12_1, L13_1, L14_1, L15_1)
      end
    end
  end
end
L8_1 = bm
L8_1 = L8_1.get_imagepath
L8_1 = L8_1()
L9_1 = L8_1
L8_1 = L8_1.match
L10_1 = "([^\\]+)$"
L8_1 = L8_1(L9_1, L10_1)
if L0_1 then
  L9_1 = L4_1
  L10_1 = L8_1
  L11_1 = string
  L11_1 = L11_1.lower
  L12_1 = L1_1
  L11_1, L12_1, L13_1, L14_1, L15_1 = L11_1(L12_1)
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
  if L9_1 then
    L9_1 = bm
    L9_1 = L9_1.add_related_string
    L10_1 = "serverName"
    L11_1 = L1_1
    L12_1 = bm
    L12_1 = L12_1.RelatedStringBMReport
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = bm
    L9_1 = L9_1.add_related_string
    L10_1 = "tamperingAlert"
    L11_1 = L3_1
    L12_1 = bm
    L12_1 = L12_1.RelatedStringBMReport
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = bm
    L9_1 = L9_1.get_current_process_startup_info
    L9_1 = L9_1()
    if L9_1 then
      L10_1 = bm
      L10_1 = L10_1.add_related_string
      L11_1 = "appName"
      L12_1 = getWebApplicationType
      L13_1 = L9_1.ppid
      L12_1 = L12_1(L13_1)
      L13_1 = bm
      L13_1 = L13_1.RelatedStringBMReport
      L10_1(L11_1, L12_1, L13_1)
    end
    L10_1 = reportSessionInformationInclusive
    L10_1()
    L10_1 = add_parents
    L10_1()
    L10_1 = reportRelevantUntrustedEntities
    L11_1 = 0
    L10_1(L11_1)
    L10_1 = pcall
    L11_1 = reportBmInfo
    L10_1, L11_1 = L10_1(L11_1)
    if not L10_1 and L11_1 then
      L12_1 = bm
      L12_1 = L12_1.add_related_string
      L13_1 = "bmInfoFailReason"
      L14_1 = tostring
      L15_1 = L11_1
      L14_1 = L14_1(L15_1)
      L15_1 = bm
      L15_1 = L15_1.RelatedStringBMReport
      L12_1(L13_1, L14_1, L15_1)
    end
    L12_1 = mp
    L12_1 = L12_1.INFECTED
    return L12_1
end
elseif L0_1 then
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "PFATamper.C"
  L11_1 = L1_1
  L12_1 = "|"
  L13_1 = L3_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L9_1(L10_1, L11_1)
else
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "PFATamper.B"
  L11_1 = L1_1
  L12_1 = "|"
  L13_1 = L3_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L9_1(L10_1, L11_1)
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "msdt:[-/]id[%s]+([^%s]+)"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L3_1.printerdiagnostic = true
  L3_1.audioplaybackdiagnostic = true
  L3_1.networkdiagnosticsnetworkadapter = true
  L3_1.networkdiagnosticsweb = true
  L3_1.devicediagnostic = true
  L3_1.networkdiagnosticsinbound = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L1_1
  L4_1 = L1_1.find
  L6_1 = "-ep%s+t?s?controlpanel"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L1_1
  L4_1 = L1_1.find
  L6_1 = "-context"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L1_1
  L4_1 = L1_1.find
  L6_1 = "systemsetting"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = bm
  L4_1 = L4_1.get_current_process_startup_info
  L4_1 = L4_1()
  L5_1 = L4_1.command_line
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1.command_line
    L5_1 = L5_1(L6_1)
    L7_1 = L5_1
    L6_1 = L5_1.find
    L8_1 = "\\systemsettings.exe"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
  end
  if L2_1 == "pcwdiagnostic" then
    L6_1 = L1_1
    L5_1 = L1_1.find
    L7_1 = "ms-msdt:[-/]d%s+pcwdiagnostic$"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = TrackPidAndTechniqueBM
    L6_1 = "BM"
    L7_1 = "T1218"
    L8_1 = "msdt_pcwdiag_source"
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = MpCommon
    L5_1 = L5_1.ExpandEnvironmentVariables
    L6_1 = "%windir%\\system32\\sdiagnhost.exe"
    L5_1 = L5_1(L6_1)
    L6_1 = sysio
    L6_1 = L6_1.GetProcessFromFileName
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    if L6_1 ~= nil then
      L7_1 = #L6_1
      if 0 < L7_1 then
        L7_1 = pairs
        L8_1 = L6_1
        L7_1, L8_1, L9_1 = L7_1(L8_1)
        for L10_1, L11_1 in L7_1, L8_1, L9_1 do
          L12_1 = string
          L12_1 = L12_1.format
          L13_1 = "pid:%d,ProcessStart:%u"
          L14_1 = L11_1.pid
          L15_1 = L11_1.starttime
          L12_1 = L12_1(L13_1, L14_1, L15_1)
          L13_1 = TrackPidAndTechniqueBM
          L14_1 = L12_1
          L15_1 = "T1218"
          L16_1 = "msdt_pcwdiag_target"
          L13_1(L14_1, L15_1, L16_1)
        end
      end
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

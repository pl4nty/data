local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = L0_1.ppid
  L3_1 = "T1218"
  L4_1 = "msdt_pcwdiag_source"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = MpCommon
  L1_1 = L1_1.ExpandEnvironmentVariables
  L2_1 = "%windir%\\system32\\sdiagnhost.exe"
  L1_1 = L1_1(L2_1)
  L2_1 = sysio
  L2_1 = L2_1.GetProcessFromFileName
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L3_1 = #L2_1
    if 0 < L3_1 then
      L3_1 = pairs
      L4_1 = L2_1
      L3_1, L4_1, L5_1 = L3_1(L4_1)
      for L6_1, L7_1 in L3_1, L4_1, L5_1 do
        L8_1 = string
        L8_1 = L8_1.format
        L9_1 = "pid:%d,ProcessStart:%u"
        L10_1 = L7_1.pid
        L11_1 = L7_1.starttime
        L8_1 = L8_1(L9_1, L10_1, L11_1)
        L9_1 = TrackPidAndTechniqueBM
        L10_1 = L8_1
        L11_1 = "T1218"
        L12_1 = "msdt_pcwdiag_target"
        L9_1(L10_1, L11_1, L12_1)
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

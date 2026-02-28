local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.integrity_level
  L2_1 = MpCommon
  L2_1 = L2_1.SECURITY_MANDATORY_MEDIUM_RID
  if L1_1 > L2_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = sysio
L1_1 = L1_1.RegExpandUserKey
L2_1 = "HKCU\\Software\\Classes\\Ms-Settings\\Shell\\Open\\Command"
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = pairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = sysio
    L7_1 = L7_1.RegOpenKey
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L8_1 = sysio
      L8_1 = L8_1.GetRegValueType
      L9_1 = L7_1
      L10_1 = "DelegateExecute"
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 then
        L9_1 = sysio
        L9_1 = L9_1.GetRegValueAsString
        L10_1 = L7_1
        L11_1 = ""
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L10_1 = string
          L10_1 = L10_1.len
          L11_1 = L9_1
          L10_1 = L10_1(L11_1)
          if 4 < L10_1 then
            L10_1 = TrackPidAndTechniqueBM
            L11_1 = L0_1.ppid
            L12_1 = "T1548.002"
            L13_1 = "uac_bypass_src"
            L10_1(L11_1, L12_1, L13_1)
            L10_1 = mp
            L10_1 = L10_1.INFECTED
            return L10_1
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = checkParentCmdlineCaseInsensitive
L3_1 = L0_1
L4_1 = {}
L5_1 = {}
L6_1 = ""
L7_1 = "Setup"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = ""
L8_1 = "oobe"
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = "oobe"
L9_1 = ""
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = {}
L9_1 = "\\Windows\\CCM\\"
L10_1 = ""
L8_1[1] = L9_1
L8_1[2] = L10_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L5_1 = 3
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = set_research_data
L3_1 = "Cmdline"
L4_1 = MpCommon
L4_1 = L4_1.Base64Encode
L5_1 = L1_1
L4_1 = L4_1(L5_1)
L5_1 = false
L2_1(L3_1, L4_1, L5_1)
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\system\\setup"
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = sysio
  L3_1 = L3_1.GetRegValueAsDword
  L4_1 = L2_1
  L5_1 = "setuptype"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 and L3_1 == 2 then
    L4_1 = mp
    L4_1 = L4_1.GetParentProcInfo
    L4_1 = L4_1()
    if L4_1 then
      L5_1 = L4_1.ppid
      if L5_1 then
        L5_1 = add_parents_mp
        L5_1 = L5_1()
        L6_1 = {}
        L6_1.cmdLine = L1_1
        L6_1.Parents = L5_1
        L7_1 = safeJsonSerialize
        L8_1 = L6_1
        L9_1 = 150
        L10_1 = nil
        L11_1 = true
        L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        L9_1 = MpCommon
        L9_1 = L9_1.BmTriggerSig
        L10_1 = L4_1.ppid
        L11_1 = "Tampering_Setup"
        L12_1 = L7_1 or L12_1
        if not L7_1 then
          L12_1 = L8_1
        end
        L9_1(L10_1, L11_1, L12_1)
      end
    end
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1

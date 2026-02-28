local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCPT:JS/AsrobfusWscrExec.A"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_166
  end
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_APPNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if not L1_1 or L2_1 ~= "JScript" and L2_1 ~= "VBScript" then
    goto lbl_166
  end
  L3_1 = pcall
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  if not L3_1 or L4_1 == nil then
    goto lbl_166
  end
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L7_1 = L5_1
  L6_1 = L5_1.find
  L8_1 = "program_files"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L7_1 = L5_1
    L6_1 = L5_1.find
    L8_1 = ":\\windows\\"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L7_1 = L5_1
      L6_1 = L5_1.find
      L8_1 = "\\netlogon\\windows7\\"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        goto lbl_66
      end
    end
  end
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  do return L6_1 end
  ::lbl_66::
  L6_1 = MpCommon
  L6_1 = L6_1.QueryPersistContext
  L7_1 = L5_1
  L8_1 = "AsrObfusWasScanned"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = MpCommon
    L6_1 = L6_1.QueryPersistContext
    L7_1 = L5_1
    L8_1 = "AsrObfusPersist"
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      L6_1 = sysio
      L6_1 = L6_1.IsFileExists
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L6_1 = sysio
        L6_1 = L6_1.GetFileSize
        L7_1 = L5_1
        L6_1 = L6_1(L7_1)
        if 300000 < L6_1 then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = sysio
        L8_1 = L8_1.ReadFile
        L9_1 = L5_1
        L10_1 = 0
        L11_1 = L6_1
        L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1, L10_1, L11_1)
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
        if L7_1 == nil then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L7_1
        L10_1 = "wscript.shell"
        L11_1 = 1
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 == nil then
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L7_1
          L10_1 = ".exec"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 == nil then
            L8_1 = mp
            L8_1 = L8_1.ReportLowfi
            L9_1 = L5_1
            L10_1 = 204144969
            L8_1(L9_1, L10_1)
            L8_1 = mp
            L8_1 = L8_1.INFECTED
            return L8_1
          end
        end
      end
    end
  end
else
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L2_1()
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
  L2_1 = MpCommon
  L2_1 = L2_1.AppendPersistContext
  L3_1 = L1_1
  L4_1 = "AsrObfusWasScanned"
  L5_1 = 0
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.get_mpattribute
  L3_1 = "SCPT:JS/AsrobfusWscrRun.B"
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "SCPT:JS/AsrobfusWscrExec.C"
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = MpCommon
      L2_1 = L2_1.AppendPersistContext
      L3_1 = L1_1
      L4_1 = "AsrObfusPersist"
      L5_1 = 0
      L2_1(L3_1, L4_1, L5_1)
    end
  end
end
::lbl_166::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

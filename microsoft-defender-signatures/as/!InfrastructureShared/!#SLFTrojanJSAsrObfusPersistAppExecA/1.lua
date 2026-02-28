local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCPT:JS/AsrobfusShellExec.A"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.get_contextdata
    L2_1 = mp
    L2_1 = L2_1.CONTEXT_DATA_AMSI_APPNAME
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    if L1_1 == "JScript" or L1_1 == "VBScript" then
      L2_1 = mp
      L2_1 = L2_1.get_contextdata
      L3_1 = mp
      L3_1 = L3_1.CONTEXT_DATA_AMSI_CONTENTNAME
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L4_1 = MpCommon
      L4_1 = L4_1.QueryPersistContext
      L5_1 = L3_1
      L6_1 = "AsrObfusWasScanned"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = MpCommon
        L4_1 = L4_1.QueryPersistContext
        L5_1 = L3_1
        L6_1 = "AsrObfusPersist"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L4_1 = sysio
          L4_1 = L4_1.IsFileExists
          L5_1 = L3_1
          L4_1 = L4_1(L5_1)
          if L4_1 then
            L4_1 = sysio
            L4_1 = L4_1.GetFileSize
            L5_1 = L3_1
            L4_1 = L4_1(L5_1)
            if not L4_1 or 300000 < L4_1 then
              L5_1 = mp
              L5_1 = L5_1.CLEAN
              return L5_1
            end
            L5_1 = string
            L5_1 = L5_1.lower
            L6_1 = sysio
            L6_1 = L6_1.ReadFile
            L7_1 = L3_1
            L8_1 = 0
            L9_1 = L4_1
            L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1, L8_1, L9_1)
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
            if not L5_1 then
              L6_1 = mp
              L6_1 = L6_1.CLEAN
              return L6_1
            end
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L5_1
            L8_1 = "shell.application"
            L9_1 = 1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L5_1
              L8_1 = ".shellexecute"
              L9_1 = 1
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if not L6_1 then
                L6_1 = mp
                L6_1 = L6_1.ReportLowfi
                L7_1 = L3_1
                L8_1 = 2066493919
                L6_1(L7_1, L8_1)
                L6_1 = mp
                L6_1 = L6_1.INFECTED
                return L6_1
              end
            end
          end
        end
      end
    end
  else
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L1_1 = L1_1()
    if not L1_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    L2_1 = MpCommon
    L2_1 = L2_1.AppendPersistContext
    L3_1 = L1_1
    L4_1 = "AsrObfusWasScanned"
    L5_1 = 0
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = mp
    L2_1 = L2_1.get_mpattribute
    L3_1 = "SCPT:JS/AsrobfusShellExec.B"
    L2_1 = L2_1(L3_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.get_mpattribute
      L3_1 = "SCPT:JS/AsrobfusShellExec.C"
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
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1

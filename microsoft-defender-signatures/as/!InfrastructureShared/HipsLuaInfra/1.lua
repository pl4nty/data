local L0_1, L1_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = {}
  L0_2["excel.exe"] = "productivity"
  L0_2["onenote.exe"] = "productivity"
  L0_2["outlook.exe"] = "communication"
  L0_2["powerpnt.exe"] = "productivity"
  L0_2["winword.exe"] = "productivity"
  L0_2["lync.exe"] = "communication2"
  L0_2["msaccess.exe"] = "productivity2"
  L0_2["mspub.exe"] = "productivity2"
  L0_2["visio.exe"] = "productivity2"
  L1_2 = mp
  L1_2 = L1_2.get_contextdata
  L2_2 = mp
  L2_2 = L2_2.CONTEXT_DATA_PROCESSNAME
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == "" then
    L2_2 = ""
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  L2_2 = L0_2[L1_2]
  if L2_2 == nil then
    L2_2 = isOutlookProcess
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = ""
      return L2_2
    end
  end
  L2_2 = MpCommon
  L2_2 = L2_2.PathToWin32Path
  L3_2 = mp
  L3_2 = L3_2.get_contextdata
  L4_2 = mp
  L4_2 = L4_2.CONTEXT_DATA_PROCESSDEVICEPATH
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  if L2_2 == nil or L2_2 == "" then
    L3_2 = ""
    return L3_2
  end
  L3_2 = string
  L3_2 = L3_2.lower
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  L3_2 = MpCommon
  L3_2 = L3_2.ExpandEnvironmentVariables
  L4_2 = "%programfiles%"
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == "" then
    L4_2 = ""
    return L4_2
  end
  L4_2 = string
  L4_2 = L4_2.lower
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  L4_2 = MpCommon
  L4_2 = L4_2.ExpandEnvironmentVariables
  L5_2 = "%programfiles(x86)%"
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == "" then
    L5_2 = ""
    return L5_2
  end
  L5_2 = string
  L5_2 = L5_2.lower
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  L5_2 = L3_2
  L6_2 = "\\microsoft office\\root\\office14"
  L5_2 = L5_2 .. L6_2
  if L2_2 ~= L5_2 then
    L5_2 = L3_2
    L6_2 = "\\microsoft office\\root\\office15"
    L5_2 = L5_2 .. L6_2
    if L2_2 ~= L5_2 then
      L5_2 = L3_2
      L6_2 = "\\microsoft office\\root\\office16"
      L5_2 = L5_2 .. L6_2
      if L2_2 ~= L5_2 then
        L5_2 = L3_2
        L6_2 = "\\microsoft office\\office14"
        L5_2 = L5_2 .. L6_2
        if L2_2 ~= L5_2 then
          L5_2 = L3_2
          L6_2 = "\\microsoft office\\office15"
          L5_2 = L5_2 .. L6_2
          if L2_2 ~= L5_2 then
            L5_2 = L3_2
            L6_2 = "\\microsoft office\\office16"
            L5_2 = L5_2 .. L6_2
            if L2_2 ~= L5_2 then
              L5_2 = L4_2
              L6_2 = "\\microsoft office\\root\\office14"
              L5_2 = L5_2 .. L6_2
              if L2_2 ~= L5_2 then
                L5_2 = L4_2
                L6_2 = "\\microsoft office\\root\\office15"
                L5_2 = L5_2 .. L6_2
                if L2_2 ~= L5_2 then
                  L5_2 = L4_2
                  L6_2 = "\\microsoft office\\root\\office16"
                  L5_2 = L5_2 .. L6_2
                  if L2_2 ~= L5_2 then
                    L5_2 = L4_2
                    L6_2 = "\\microsoft office\\office14"
                    L5_2 = L5_2 .. L6_2
                    if L2_2 ~= L5_2 then
                      L5_2 = L4_2
                      L6_2 = "\\microsoft office\\office15"
                      L5_2 = L5_2 .. L6_2
                      if L2_2 ~= L5_2 then
                        L5_2 = L4_2
                        L6_2 = "\\microsoft office\\office16"
                        L5_2 = L5_2 .. L6_2
                        if L2_2 ~= L5_2 then
                          L6_2 = L2_2
                          L5_2 = L2_2.find
                          L7_2 = L3_2
                          L8_2 = "\\windowsapps\\microsoft.office.desktop."
                          L7_2 = L7_2 .. L8_2
                          L8_2 = 1
                          L9_2 = true
                          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
                          if L5_2 == nil then
                            L6_2 = L2_2
                            L5_2 = L2_2.find
                            L7_2 = L4_2
                            L8_2 = "\\windowsapps\\microsoft.office.desktop."
                            L7_2 = L7_2 .. L8_2
                            L8_2 = 1
                            L9_2 = true
                            L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
                            if L5_2 == nil then
                              goto lbl_166
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L5_2 = L0_2[L1_2]
  do return L5_2 end
  ::lbl_166::
  L5_2 = ""
  return L5_2
end

GetCtxOfficeProc = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = mp
  L0_2 = L0_2.GetCertificateInfo
  L0_2 = L0_2()
  L1_2 = pairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = L5_2.Signers
    if L6_2 ~= nil then
      L6_2 = true
      return L6_2
    end
  end
  L1_2 = false
  return L1_2
end

is_signed = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = mp
  L1_2 = L1_2.get_contextdata
  L2_2 = mp
  L2_2 = L2_2.CONTEXT_DATA_PROCESS_PPID
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = mp
    L2_2 = L2_2.GetProcessCommandLine
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= nil and L2_2 ~= "" then
      L3_2 = string
      L3_2 = L3_2.lower
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
      L3_2 = string
      L3_2 = L3_2.match
      L4_2 = L2_2
      L5_2 = ".:\\program files\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
      L3_2 = L3_2(L4_2, L5_2)
      L0_2 = L3_2
      if L0_2 == nil or L0_2 == "" then
        L3_2 = string
        L3_2 = L3_2.match
        L4_2 = L2_2
        L5_2 = ".:\\program files\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
        L3_2 = L3_2(L4_2, L5_2)
        L0_2 = L3_2
        if L0_2 == nil or L0_2 == "" then
          L3_2 = string
          L3_2 = L3_2.match
          L4_2 = L2_2
          L5_2 = ".:\\program files %(x86%)\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
          L3_2 = L3_2(L4_2, L5_2)
          L0_2 = L3_2
          if L0_2 == nil or L0_2 == "" then
            L3_2 = string
            L3_2 = L3_2.match
            L4_2 = L2_2
            L5_2 = ".:\\program files %(x86%)\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
            L3_2 = L3_2(L4_2, L5_2)
            L0_2 = L3_2
            if L0_2 == nil or L0_2 == "" then
              L3_2 = string
              L3_2 = L3_2.match
              L4_2 = L2_2
              L5_2 = ".:\\program files\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
              L3_2 = L3_2(L4_2, L5_2)
              L0_2 = L3_2
              if L0_2 == nil or L0_2 == "" then
                L3_2 = string
                L3_2 = L3_2.match
                L4_2 = L2_2
                L5_2 = ".:\\program files %(x86%)\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
                L3_2 = L3_2(L4_2, L5_2)
                L0_2 = L3_2
              end
            end
          end
        end
      end
    end
  end
  if L0_2 == nil or L0_2 == "" then
    L2_2 = nil
    return L2_2
  end
  L2_2 = MpCommon
  L2_2 = L2_2.PathToWin32Path
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "" and L2_2 ~= nil then
    return L2_2
  else
    return L0_2
  end
end

GetInvolvedFileInCmdLnIfExistOnMachine = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = mp
  L1_2 = L1_2.get_contextdata
  L2_2 = mp
  L2_2 = L2_2.CONTEXT_DATA_AMSI_OPERATION_PPID
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = mp
    L2_2 = L2_2.GetProcessCommandLine
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= nil and L2_2 ~= "" then
      L3_2 = string
      L3_2 = L3_2.lower
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
      L3_2 = string
      L3_2 = L3_2.match
      L4_2 = L2_2
      L5_2 = ".:\\program files\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
      L3_2 = L3_2(L4_2, L5_2)
      L0_2 = L3_2
      if L0_2 == nil or L0_2 == "" then
        L3_2 = string
        L3_2 = L3_2.match
        L4_2 = L2_2
        L5_2 = ".:\\program files\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
        L3_2 = L3_2(L4_2, L5_2)
        L0_2 = L3_2
        if L0_2 == nil or L0_2 == "" then
          L3_2 = string
          L3_2 = L3_2.match
          L4_2 = L2_2
          L5_2 = ".:\\program files %(x86%)\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
          L3_2 = L3_2(L4_2, L5_2)
          L0_2 = L3_2
          if L0_2 == nil or L0_2 == "" then
            L3_2 = string
            L3_2 = L3_2.match
            L4_2 = L2_2
            L5_2 = ".:\\program files %(x86%)\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
            L3_2 = L3_2(L4_2, L5_2)
            L0_2 = L3_2
            if L0_2 == nil or L0_2 == "" then
              L3_2 = string
              L3_2 = L3_2.match
              L4_2 = L2_2
              L5_2 = ".:\\program files\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
              L3_2 = L3_2(L4_2, L5_2)
              L0_2 = L3_2
              if L0_2 == nil or L0_2 == "" then
                L3_2 = string
                L3_2 = L3_2.match
                L4_2 = L2_2
                L5_2 = ".:\\program files %(x86%)\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\""
                L3_2 = L3_2(L4_2, L5_2)
                L0_2 = L3_2
              end
            end
          end
        end
      end
    end
  end
  if L0_2 == nil or L0_2 == "" then
    L2_2 = nil
    return L2_2
  end
  L2_2 = MpCommon
  L2_2 = L2_2.PathToWin32Path
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "" and L2_2 ~= nil then
    return L2_2
  else
    return L0_2
  end
end

GetInvolvedFileInCmdLnIfExistOnMachineAMSI = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = mp
  L0_2 = L0_2.get_contextdata
  L1_2 = mp
  L1_2 = L1_2.CONTEXT_DATA_SCANREASON
  L0_2 = L0_2(L1_2)
  L1_2 = mp
  L1_2 = L1_2.SCANREASON_AMSI
  if L0_2 ~= L1_2 then
    L0_2 = nil
    return L0_2
  end
  L0_2 = nil
  L1_2 = mp
  L1_2 = L1_2.get_contextdata
  L2_2 = mp
  L2_2 = L2_2.CONTEXT_DATA_AMSI_CONTENTNAME
  L1_2 = L1_2(L2_2)
  L0_2 = L1_2
  if L0_2 == nil or L0_2 == "" then
    L1_2 = nil
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = L0_2
  L3_2 = "(.*)%.(%a+)->%w+/%w+.bin$"
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil or L1_2 == "" or L2_2 == nil or L2_2 == "" then
    L3_2 = nil
    return L3_2
  end
  L3_2 = L1_2
  L4_2 = "."
  L5_2 = L2_2
  L0_2 = L3_2 .. L4_2 .. L5_2
  L3_2 = string
  L3_2 = L3_2.lower
  L4_2 = MpCommon
  L4_2 = L4_2.PathToWin32Path
  L5_2 = L0_2
  L4_2, L5_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2)
  L0_2 = L3_2
  if L0_2 == nil or L0_2 == "" then
    L3_2 = nil
    return L3_2
  end
  L3_2 = sysio
  L3_2 = L3_2.IsFileExists
  L4_2 = L0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    return L0_2
  end
  L3_2 = nil
  return L3_2
end

GetNonVfoAmsiContentNamePathIfExistOnMachine = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = mp
  L0_2 = L0_2.getfilename
  L1_2 = mp
  L1_2 = L1_2.bitor
  L2_2 = mp
  L2_2 = L2_2.FILEPATH_QUERY_CNAME
  L3_2 = mp
  L3_2 = L3_2.FILEPATH_QUERY_LOWERCASE
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2)
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  if L0_2 == nil or L0_2 == "" then
    L1_2 = nil
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = MpCommon
  L2_2 = L2_2.PathToWin32Path
  L3_2 = L0_2
  L2_2, L3_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil or L1_2 == "" then
    L2_2 = nil
    return L2_2
  end
  L2_2 = sysio
  L2_2 = L2_2.IsFileExists
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    return L1_2
  end
  L2_2 = nil
  return L2_2
end

GetNonVfoScannedFilePathIfExistOnMachine = L0_1

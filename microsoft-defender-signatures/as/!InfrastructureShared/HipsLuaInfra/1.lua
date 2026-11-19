-- Threat: !InfrastructureShared
-- Name: HipsLuaInfra
-- Type: 1
-- Includes: GetEmailPaths

function GetCtxOfficeProc()
  local l_1_0 = {
    ["excel.exe"] = "productivity",
    
    ["onenote.exe"] = "productivity",
    ["outlook.exe"] = "communication",
    ["powerpnt.exe"] = "productivity",
    ["winword.exe"] = "productivity",
    ["lync.exe"] = "communication2",
    ["msaccess.exe"] = "productivity2",
    ["mspub.exe"] = "productivity2",
    ["visio.exe"] = "productivity2"
  }
  local l_1_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_1_1 == nil or l_1_1 == "" then
    return ""
  end
  l_1_1 = string.lower(l_1_1)
  if l_1_0[l_1_1] == nil and not isOutlookProcess(l_1_1) then
    return ""
  end
  local l_1_2 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
  if l_1_2 == nil or l_1_2 == "" then
    return ""
  end
  l_1_2 = string.lower(l_1_2)
  local l_1_3 = MpCommon.ExpandEnvironmentVariables("%programfiles%")
  if l_1_3 == nil or l_1_3 == "" then
    return ""
  end
  l_1_3 = string.lower(l_1_3)
  local l_1_4 = MpCommon.ExpandEnvironmentVariables("%programfiles(x86)%")
  if l_1_4 == nil or l_1_4 == "" then
    return ""
  end
  l_1_4 = string.lower(l_1_4)
  if l_1_2 == l_1_3 .. "\\microsoft office\\root\\office14" or l_1_2 == l_1_3 .. "\\microsoft office\\root\\office15" or l_1_2 == l_1_3 .. "\\microsoft office\\root\\office16" or l_1_2 == l_1_3 .. "\\microsoft office\\office14" or l_1_2 == l_1_3 .. "\\microsoft office\\office15" or l_1_2 == l_1_3 .. "\\microsoft office\\office16" or l_1_2 == l_1_4 .. "\\microsoft office\\root\\office14" or l_1_2 == l_1_4 .. "\\microsoft office\\root\\office15" or l_1_2 == l_1_4 .. "\\microsoft office\\root\\office16" or l_1_2 == l_1_4 .. "\\microsoft office\\office14" or l_1_2 == l_1_4 .. "\\microsoft office\\office15" or l_1_2 == l_1_4 .. "\\microsoft office\\office16" or l_1_2:find(l_1_3 .. "\\windowsapps\\microsoft.office.desktop.", 1, true) ~= nil or l_1_2:find(l_1_4 .. "\\windowsapps\\microsoft.office.desktop.", 1, true) ~= nil then
    return l_1_0[l_1_1]
  end
  return ""
end

function is_signed()
  local l_2_0 = mp.GetCertificateInfo()
  for l_2_1, l_2_2 in pairs(l_2_0) do
    if l_2_2.Signers ~= nil then
      return true
    end
  end
  return false
end

function GetInvolvedFileInCmdLnIfExistOnMachine()
  local l_3_0
  local l_3_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_3_1 ~= nil then
    local l_3_2 = mp.GetProcessCommandLine(l_3_1)
    if l_3_2 ~= nil and l_3_2 ~= "" then
      l_3_2 = string.lower(l_3_2)
      l_3_0 = string.match(l_3_2, ".:\\program files\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
      if l_3_0 == nil or l_3_0 == "" then
        l_3_0 = string.match(l_3_2, ".:\\program files\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
        if l_3_0 == nil or l_3_0 == "" then
          l_3_0 = string.match(l_3_2, ".:\\program files %(x86%)\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
          if l_3_0 == nil or l_3_0 == "" then
            l_3_0 = string.match(l_3_2, ".:\\program files %(x86%)\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
            if l_3_0 == nil or l_3_0 == "" then
              l_3_0 = string.match(l_3_2, ".:\\program files\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
              if l_3_0 == nil or l_3_0 == "" then
                l_3_0 = string.match(l_3_2, ".:\\program files %(x86%)\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
              end
            end
          end
        end
      end
    end
  end
  if l_3_0 == nil or l_3_0 == "" then
    return nil
  end
  local l_3_3 = MpCommon.PathToWin32Path(l_3_0)
  if l_3_3 ~= "" and l_3_3 ~= nil then
    return l_3_3
  else
    return l_3_0
  end
end

function GetInvolvedFileInCmdLnIfExistOnMachineAMSI()
  local l_4_0
  local l_4_1 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_4_1 ~= nil then
    local l_4_2 = mp.GetProcessCommandLine(l_4_1)
    if l_4_2 ~= nil and l_4_2 ~= "" then
      l_4_2 = string.lower(l_4_2)
      l_4_0 = string.match(l_4_2, ".:\\program files\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
      if l_4_0 == nil or l_4_0 == "" then
        l_4_0 = string.match(l_4_2, ".:\\program files\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
        if l_4_0 == nil or l_4_0 == "" then
          l_4_0 = string.match(l_4_2, ".:\\program files %(x86%)\\microsoft office\\root\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
          if l_4_0 == nil or l_4_0 == "" then
            l_4_0 = string.match(l_4_2, ".:\\program files %(x86%)\\microsoft office\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
            if l_4_0 == nil or l_4_0 == "" then
              l_4_0 = string.match(l_4_2, ".:\\program files\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
              if l_4_0 == nil or l_4_0 == "" then
                l_4_0 = string.match(l_4_2, ".:\\program files %(x86%)\\windowsapps\\microsoft%.office[^\\]+\\office..\\[^%.]+%.exe\"?[^\"]+\"([^\"]+)\"")
              end
            end
          end
        end
      end
    end
  end
  if l_4_0 == nil or l_4_0 == "" then
    return nil
  end
  local l_4_3 = MpCommon.PathToWin32Path(l_4_0)
  if l_4_3 ~= "" and l_4_3 ~= nil then
    return l_4_3
  else
    return l_4_0
  end
end

function GetNonVfoAmsiContentNamePathIfExistOnMachine()
  if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
    return nil
  end
  local l_5_0
  l_5_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_5_0 == nil or l_5_0 == "" then
    return nil
  end
  local l_5_1, l_5_2 = string.match(l_5_0, "(.*)%.(%a+)->%w+/%w+.bin$")
  if l_5_1 == nil or l_5_1 == "" or l_5_2 == nil or l_5_2 == "" then
    return nil
  end
  l_5_0 = l_5_1 .. "." .. l_5_2
  l_5_0 = string.lower(MpCommon.PathToWin32Path(l_5_0))
  if l_5_0 == nil or l_5_0 == "" then
    return nil
  end
  if sysio.IsFileExists(l_5_0) then
    return l_5_0
  end
  return nil
end

function GetNonVfoScannedFilePathIfExistOnMachine()
  local l_6_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_CNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_6_0 == nil or l_6_0 == "" then
    return nil
  end
  local l_6_1 = string.lower(MpCommon.PathToWin32Path(l_6_0))
  if l_6_1 == nil or l_6_1 == "" then
    return nil
  end
  if sysio.IsFileExists(l_6_1) then
    return l_6_1
  end
  return nil
end

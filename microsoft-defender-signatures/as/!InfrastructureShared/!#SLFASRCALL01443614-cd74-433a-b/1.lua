local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "01443614-cd74-433a-b99e-2ecdc07bfc25"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_parent_filehandle
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.is_handle_nil
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONOPEN
if L1_1 ~= L2_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = versioning
L1_1 = L1_1.GetOsBuildNumber
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
L2_1 = L2_1(L3_1)
if L2_1 == true or L1_1 < 10240 then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_FULL
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil and L2_1 ~= "" then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = MpCommon
    L4_1 = L4_1.PathToWin32Path
    L5_1 = L2_1
    L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1)
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
    L2_1 = L3_1
    L3_1 = mp
    L3_1 = L3_1.IsPathExcludedForHipsRule
    L4_1 = L2_1
    L5_1 = "01443614-cd74-433a-b99e-2ecdc07bfc25"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = versioning
    L3_1 = L3_1.GetOrgID
    L3_1 = L3_1()
    if L3_1 ~= nil and L3_1 ~= "" then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
    end
    if L3_1 ~= nil and L3_1 == "ede93498-0189-4b5a-bb7d-bdb374cbebd3" then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L2_1
      L6_1 = "^.:\\program files\\safebreach\\safebreach endpoint simulator\\app\\"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 ~= nil then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
    end
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = "^.:\\programdata\\chocolatey\\bin\\[^%.\\]+%.exe$"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = MpCommon
    L7_1 = L7_1.ExpandEnvironmentVariables
    L8_1 = "%systemroot%"
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    L7_1 = "\\system32\\mrt.exe"
    L6_1 = L6_1 .. L7_1
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 ~= nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = "^.:\\windows\\"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
      L4_1 = L4_1(L5_1)
      if L4_1 ~= nil and L4_1 ~= "" then
        L5_1 = string
        L5_1 = L5_1.lower
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        if L5_1 == "powershell.exe" then
          L5_1 = mp
          L5_1 = L5_1.get_contextdata
          L6_1 = mp
          L6_1 = L6_1.CONTEXT_DATA_PROCESS_PPID
          L5_1 = L5_1(L6_1)
          if L5_1 ~= nil then
            L6_1 = mp
            L6_1 = L6_1.GetProcessCommandLine
            L7_1 = L5_1
            L6_1 = L6_1(L7_1)
            if L6_1 ~= nil then
              L7_1 = #L6_1
              if 50 < L7_1 then
                L7_1 = string
                L7_1 = L7_1.find
                L8_1 = string
                L8_1 = L8_1.lower
                L9_1 = L6_1
                L8_1 = L8_1(L9_1)
                L9_1 = "-executionpolicy allsigned .+windows defender advanced threat protection\\datacollection"
                L7_1 = L7_1(L8_1, L9_1)
                if L7_1 ~= nil then
                  L7_1 = mp
                  L7_1 = L7_1.CLEAN
                  return L7_1
                end
              end
            end
          end
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.IsTrustedFile
  L4_1 = false
  L3_1, L4_1 = L3_1(L4_1)
  if L3_1 == false then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1

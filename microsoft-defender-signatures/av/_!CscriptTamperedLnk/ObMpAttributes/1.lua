local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\temp\\"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "startmenubuilder"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
if L2_1 ~= "cscript.exe" then
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESSDEVICEPATH
  L3_1 = L3_1(L4_1)
  if L3_1 == nil or L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = MpCommon
  L4_1 = L4_1.PathToWin32Path
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  if L3_1 == nil or L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = L3_1
  L5_1 = "\\"
  L6_1 = L2_1
  L3_1 = L4_1 .. L5_1 .. L6_1
  L4_1 = nil
  L5_1 = sysio
  L5_1 = L5_1.GetPEVersionInfo
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  if L5_1 ~= nil then
    L6_1 = L5_1.OriginalFilename
    if L6_1 ~= nil then
      L6_1 = L5_1.OriginalFilename
      if L6_1 ~= "" then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = L5_1.OriginalFilename
        L6_1 = L6_1(L7_1)
        L4_1 = L6_1
      end
    end
  end
  if L4_1 ~= "cscript.exe" then
    L6_1 = MpCommon
    L6_1 = L6_1.GetOriginalFileName
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    if L6_1 == nil or L6_1 == "" then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
    L7_1 = string
    L7_1 = L7_1.match
    L8_1 = L6_1
    L9_1 = "%.([^%.]+)$"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 == nil then
      L7_1 = L6_1
      L8_1 = ".exe"
      L6_1 = L7_1 .. L8_1
    end
    if L6_1 ~= "cscript.exe" then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.GetLnkInfo
L3_1 = L3_1()
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.BasePath
if L4_1 ~= nil then
  L4_1 = L3_1.BasePath
  if L4_1 ~= "" then
    L4_1 = L3_1.BasePath
    L5_1 = mp
    L5_1 = L5_1.ContextualExpandEnvironmentVariables
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    if L4_1 ~= nil then
      L5_1 = MpCommon
      L5_1 = L5_1.PathToWin32Path
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      L4_1 = L5_1
      if L4_1 ~= nil then
        L5_1 = string
        L5_1 = L5_1.lower
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        L4_1 = L5_1
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = "\\windows\\system32\\calc.exe$"
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 ~= nil then
          L5_1 = sysio
          L5_1 = L5_1.IsFileExists
          L6_1 = L4_1
          L5_1 = L5_1(L6_1)
          if L5_1 then
            L5_1 = mp
            L5_1 = L5_1.INFECTED
            return L5_1
          end
        end
      end
    end
  end
end
L4_1 = L3_1.RelativePath
if L4_1 ~= nil then
  L4_1 = L3_1.RelativePath
  if L4_1 ~= "" then
    L4_1 = L3_1.RelativePath
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L5_1 = mp
    L5_1 = L5_1.getfilename
    L6_1 = mp
    L6_1 = L6_1.FILEPATH_QUERY_PATH
    L5_1 = L5_1(L6_1)
    if L5_1 == nil or L5_1 == "" then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = MpCommon
    L6_1 = L6_1.PathToWin32Path
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
    if L5_1 == nil or L5_1 == "" then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
    L6_1 = nil
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L4_1
    L9_1 = "^%.%.\\"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L7_1 = L5_1
      L8_1 = "\\"
      L9_1 = L4_1
      L6_1 = L7_1 .. L8_1 .. L9_1
    else
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L4_1
      L9_1 = "^%.\\"
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 then
        L7_1 = string
        L7_1 = L7_1.match
        L8_1 = L4_1
        L9_1 = "^%.\\(.+)$"
        L7_1 = L7_1(L8_1, L9_1)
        L4_1 = L7_1
        L7_1 = L5_1
        L8_1 = "\\"
        L9_1 = L4_1
        L6_1 = L7_1 .. L8_1 .. L9_1
      else
        L7_1 = mp
        L7_1 = L7_1.CLEAN
        return L7_1
      end
    end
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L6_1
    L9_1 = "\\windows\\system32\\calc.exe$"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 ~= nil then
      L7_1 = sysio
      L7_1 = L7_1.IsFileExists
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1

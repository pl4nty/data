-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32CscriptTamperedLnk\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1, "startmenubuilder", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if l_0_2 ~= "cscript.exe" then
  local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  l_0_3 = l_0_3 .. "\\" .. l_0_2
  local l_0_4 = nil
  local l_0_5 = (sysio.GetPEVersionInfo)(l_0_3)
  if l_0_5 ~= nil and l_0_5.OriginalFilename ~= nil and l_0_5.OriginalFilename ~= "" then
    l_0_4 = (string.lower)(l_0_5.OriginalFilename)
  end
  if l_0_4 ~= "cscript.exe" then
    local l_0_6 = (MpCommon.GetOriginalFileName)(l_0_3)
    if l_0_6 == nil or l_0_6 == "" then
      return mp.CLEAN
    end
    l_0_6 = (string.lower)(l_0_6)
    if (string.match)(l_0_6, "%.([^%.]+)$") == nil then
      l_0_6 = l_0_6 .. ".exe"
    end
    if l_0_6 ~= "cscript.exe" then
      return mp.CLEAN
    end
  end
end
do
  local l_0_7 = (mp.GetLnkInfo)()
  if l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  do
    if l_0_7.BasePath ~= nil and l_0_7.BasePath ~= "" then
      local l_0_8 = l_0_7.BasePath
      l_0_8 = (mp.ContextualExpandEnvironmentVariables)(l_0_8)
      if l_0_8 ~= nil then
        l_0_8 = (MpCommon.PathToWin32Path)(l_0_8)
        if l_0_8 ~= nil then
          l_0_8 = (string.lower)(l_0_8)
          if (string.find)(l_0_8, "\\windows\\system32\\calc.exe$") ~= nil and (sysio.IsFileExists)(l_0_8) then
            return mp.INFECTED
          end
        end
      end
    end
    if l_0_7.RelativePath ~= nil and l_0_7.RelativePath ~= "" then
      local l_0_9 = l_0_7.RelativePath
      l_0_9 = (string.lower)(l_0_9)
      local l_0_10 = (mp.getfilename)(mp.FILEPATH_QUERY_PATH)
      if l_0_10 == nil or l_0_10 == "" then
        return mp.CLEAN
      end
      l_0_10 = (MpCommon.PathToWin32Path)(l_0_10)
      if l_0_10 == nil or l_0_10 == "" then
        return mp.CLEAN
      end
      l_0_10 = (string.lower)(l_0_10)
      local l_0_11 = nil
      if (string.find)(l_0_9, "^%.%.\\") then
        l_0_11 = l_0_10 .. "\\" .. l_0_9
      else
        if (string.find)(l_0_9, "^%.\\") then
          l_0_9 = (string.match)(l_0_9, "^%.\\(.+)$")
          l_0_11 = l_0_10 .. "\\" .. l_0_9
        else
          return mp.CLEAN
        end
      end
      if (string.find)(l_0_11, "\\windows\\system32\\calc.exe$") ~= nil and (sysio.IsFileExists)(l_0_11) then
        return mp.INFECTED
      end
    end
    do
      return mp.CLEAN
    end
  end
end


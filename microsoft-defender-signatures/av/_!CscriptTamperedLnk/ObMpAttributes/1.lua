-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!CscriptTamperedLnk\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_0 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and (l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or (MpCommon.IsSampled)(100, false, true, true) ~= true) and (MpCommon.IsSampled)(1, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
if (string.find)(l_0_2, "startmenubuilder", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if l_0_3 ~= "cscript.exe" then
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  l_0_4 = (MpCommon.PathToWin32Path)(l_0_4)
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
  l_0_4 = l_0_4 .. "\\" .. l_0_3
  local l_0_5 = nil
  local l_0_6 = (sysio.GetPEVersionInfo)(l_0_4)
  if l_0_6 ~= nil and l_0_6.OriginalFilename ~= nil and l_0_6.OriginalFilename ~= "" then
    l_0_5 = (string.lower)(l_0_6.OriginalFilename)
  end
  if l_0_5 ~= "cscript.exe" then
    local l_0_7 = (MpCommon.GetOriginalFileName)(l_0_4)
    if l_0_7 == nil or l_0_7 == "" then
      return mp.CLEAN
    end
    l_0_7 = (string.lower)(l_0_7)
    if (string.match)(l_0_7, "%.([^%.]+)$") == nil then
      l_0_7 = l_0_7 .. ".exe"
    end
    if l_0_7 ~= "cscript.exe" then
      return mp.CLEAN
    end
  end
end
do
  local l_0_8 = (mp.GetLnkInfo)()
  if l_0_8 == nil or l_0_8 == "" then
    return mp.CLEAN
  end
  do
    if l_0_8.BasePath ~= nil and l_0_8.BasePath ~= "" then
      local l_0_9 = l_0_8.BasePath
      l_0_9 = (mp.ContextualExpandEnvironmentVariables)(l_0_9)
      if l_0_9 ~= nil then
        l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
        if l_0_9 ~= nil then
          l_0_9 = (string.lower)(l_0_9)
          if (string.find)(l_0_9, "\\windows\\system32\\calc.exe$") ~= nil and (sysio.IsFileExists)(l_0_9) then
            return mp.INFECTED
          end
        end
      end
    end
    if l_0_8.RelativePath ~= nil and l_0_8.RelativePath ~= "" then
      local l_0_10 = l_0_8.RelativePath
      l_0_10 = (string.lower)(l_0_10)
      local l_0_11 = (mp.getfilename)(mp.FILEPATH_QUERY_PATH)
      if l_0_11 == nil or l_0_11 == "" then
        return mp.CLEAN
      end
      l_0_11 = (MpCommon.PathToWin32Path)(l_0_11)
      if l_0_11 == nil or l_0_11 == "" then
        return mp.CLEAN
      end
      l_0_11 = (string.lower)(l_0_11)
      local l_0_12 = nil
      if (string.find)(l_0_10, "^%.%.\\") then
        l_0_12 = l_0_11 .. "\\" .. l_0_10
      else
        if (string.find)(l_0_10, "^%.\\") then
          l_0_10 = (string.match)(l_0_10, "^%.\\(.+)$")
          l_0_12 = l_0_11 .. "\\" .. l_0_10
        else
          return mp.CLEAN
        end
      end
      if (string.find)(l_0_12, "\\windows\\system32\\calc.exe$") ~= nil and (sysio.IsFileExists)(l_0_12) then
        return mp.INFECTED
      end
    end
    do
      return mp.CLEAN
    end
  end
end


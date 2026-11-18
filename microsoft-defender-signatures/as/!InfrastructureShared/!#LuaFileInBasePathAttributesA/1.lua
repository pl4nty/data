-- Threat: !InfrastructureShared
-- Name: !#//Lua:FileInBasePathAttributes.A
-- Type: 12
-- Includes: Path

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and 10 < #l_0_0 then
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 100 then
    return mp.CLEAN
  end
  l_0_0 = normalize_path(l_0_0)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_2 = {
    [":\\programdata"] = "programdata",
    ["\\appdata\\roaming"] = "appdata",
    [":\\program files\\common files"] = "commonprogramfiles",
    [":\\program files (x86)\\common files"] = "commonprogramfilesx86",
    ["\\appdata\\local"] = "localappdata",
    ["\\appdata\\locallow"] = "locallowappdata",
    [":\\program files"] = "programfiles",
    [":\\program files (x86)"] = "programfilesx86",
    [":\\users\\public"] = "public",
    [":\\windows"] = "windir",
    [":\\windows\\system32"] = "sysdir",
    [":\\windows\\syswow64"] = "syswow64",
    ["\\appdata\\local\\temp"] = "temp",
    [":\\windows\\system32\\wbem"] = "wbem",
    [":\\windows\\syswow64\\wbem"] = "wbem",
    [":\\windows\\servicing"] = "servicing"
  }
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if #l_0_0 > #l_0_3 then
      local l_0_5 = string.sub(l_0_0, -#l_0_3)
      if l_0_5 == l_0_3 then
        local l_0_6 = "Lua:Context/FileInBasePath.A!" .. l_0_4
        mp.set_mpattribute(l_0_6)
        return mp.CLEAN
      end
    end
  end
  if string.sub(l_0_0, 1, 2) == "\\\\" then
    mp.set_mpattribute("Lua:Context/FileInNetworkShare.A")
    return mp.CLEAN
  end
  if 35 < #l_0_0 then
    if string.sub(l_0_0, 2, 17) == ":\\windows\\winsxs" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!winsxs")
      return mp.CLEAN
    end
    if string.sub(l_0_0, 2, 31) == ":\\windows\\softwaredistribution" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!softwaredistribution")
      return mp.CLEAN
    end
    if string.sub(l_0_0, 2, 15) == ":\\windows\\csc\\" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!csc")
      return mp.CLEAN
    end
    if string.sub(l_0_0, 2, 20) == ":\\windows\\assembly\\" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!assembly")
      return mp.CLEAN
    end
    if string.sub(l_0_0, 2, 21) == ":\\windows\\servicing\\" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!servicing")
      return mp.CLEAN
    end
    if string.sub(l_0_0, 2, 35) == ":\\windows\\microsoft.net\\framework\\" or string.sub(l_0_0, 2, 37) == ":\\windows\\microsoft.net\\framework64\\" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!framework")
      return mp.CLEAN
    end
    if string.sub(l_0_0, 2, 51) == ":\\programdata\\microsoft\\windows defender\\platform\\" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!wdplatform")
      return mp.CLEAN
    end
    if string.sub(l_0_0, 2, 22) == ":\\windows\\installer\\{" then
      mp.set_mpattribute("Lua:Context/FileInSubStrPath.A!windowsinstaller")
      return mp.CLEAN
    end
  end
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: !#Lua:FileInSpecialFolder.A
-- Type: 12
-- Includes: Path
-- MpAttributes: RPF:TopLevelFile

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
    ["\\appdata\\local\\temp"] = "temp",
    ["\\appdata\\local"] = "localappdata",
    ["\\appdata\\locallow"] = "locallowappdata",
    [":\\program files"] = "programfiles",
    [":\\program files (x86)"] = "programfilesx86",
    [":\\users\\public"] = "public",
    [":\\windows\\system32\\wbem"] = "wbem",
    [":\\windows\\syswow64\\wbem"] = "wbem",
    [":\\windows\\servicing"] = "servicing",
    [":\\windows\\system32"] = "sysdir",
    [":\\windows\\syswow64"] = "syswow64",
    [":\\windows"] = "windir"
  }
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if #l_0_0 > #l_0_3 and l_0_0:find(l_0_3, 1, true) then
      local l_0_5 = "Lua:Context/FileInPath.A!" .. l_0_4
      mp.set_mpattribute(l_0_5)
      return mp.CLEAN
    end
  end
end
return mp.CLEAN

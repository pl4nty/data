-- Threat: \xac!Malagent.SA
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE & Lua:TopLevelUnsigned

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_2 = {
  ["svhost.dll"] = true,
  ["svhost.exe"] = true,
  ["x64win.exe"] = true,
  ["x64win.dll"] = true,
  ["x32win.dll"] = true,
  ["x32win.exe"] = true,
  ["dlihost.exe"] = true
}
if l_0_2[l_0_1] then
  if mp.IsTrustedFile(false) == true then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

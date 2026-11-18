-- Threat: !InfrastructureShared
-- Name: !#ALF:VirTool:Win32/DevilsTongueConfig.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:DATExt

local l_0_0 = mp.getfilesize()
if l_0_0 < 40000 or 48000000 < l_0_0 then
  return mp.CLEAN
end
if l_0_0 % 16 ~= 0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
l_0_1 = string.lower(l_0_1)
if l_0_1 ~= nil and l_0_1:len() > 40 and l_0_1:find("c:\\windows\\system32\\config\\", 1, true) then
  if l_0_1:find("\\config\\systemprofile\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\system32\\config\\cache\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\recoverybin\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\appdata\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("ntuser.dat", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\system32\\config\\journal", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\system32\\config\\regback", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("\\system32\\config\\txr", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = select(2, string.gsub(l_0_1, "\\", ""))
  if l_0_2 < 5 then
    return mp.CLEAN
  end
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN

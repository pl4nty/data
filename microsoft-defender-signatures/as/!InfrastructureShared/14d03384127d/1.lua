-- Threat: !InfrastructureShared
-- Name: 14d03384127d
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 720896 or 2097152 < l_0_0 then
  return mp.CLEAN
end
if not mp.get_mpattribute("AGGR:ScrFileExt.A") and not mp.get_mpattribute("Lua:OverSizedLnkFile") then
  return mp.CLEAN
end
if 688128 < l_0_0 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(679936, l_0_0 - 679936 - 8192)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = tostring(l_0_1)
  if l_0_1:find("(Replace(Replace(CStr(", 1, true) and l_0_1:find("GetObject(\"winmgmts:root\\cimv2\")", 1, true) and l_0_1:find(".Get(\"Win32_ProcessStartup\").SpawnInstance_", 1, true) and l_0_1:find(".ShowWindow = 0", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

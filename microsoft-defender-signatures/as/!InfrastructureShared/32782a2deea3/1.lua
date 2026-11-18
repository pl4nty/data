-- Threat: !InfrastructureShared
-- Name: 32782a2deea3
-- Type: 21

if mp.getfilesize() < 65536 then
  return mp.CLEAN
end
if mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or l_0_0 == "" then
  return mp.INFECTED
end
local l_0_1 = string.match(l_0_0, "^(.*[/\\])") or ""
local l_0_2 = "loadcert.ini"
local l_0_3 = l_0_1 .. l_0_2
if sysio.IsFileExists(l_0_3) then
  mp.ReportLowfi(l_0_3, 1640592047)
end
return mp.INFECTED

-- Threat: !InfrastructureShared
-- Name: 4c78b942b000
-- Type: 21

if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or l_0_0 == "" then
  return mp.INFECTED
end
local l_0_1 = string.match(l_0_0, "^(.*[/\\])") or ""
local l_0_2 = "core.sh"
local l_0_3 = l_0_1 .. l_0_2
if sysio.IsFileExists(l_0_3) then
  mp.ReportLowfi(l_0_3, 2508270477)
end
return mp.INFECTED

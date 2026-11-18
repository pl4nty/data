-- Threat: Backdoor:ASP/ExchgWeb.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & AGGR:ProcessArtifacts.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\frontend\\") ~= nil or string.find(l_0_0, "\\frontend\\httpproxy\\owa\\", 1, true) ~= nil or string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\clientaccess\\") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

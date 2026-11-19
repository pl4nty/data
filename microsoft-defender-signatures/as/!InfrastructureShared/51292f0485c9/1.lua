-- Threat: !InfrastructureShared
-- Name: 51292f0485c9
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\frontend\\") ~= nil or string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\clientaccess\\") ~= nil or string.match(l_0_0, "\\microsoft shared\\web server extensions\\v%d%d\\template\\layouts\\") ~= nil or string.find(l_0_0, "\\frontend\\httpproxy\\owa\\", 1, true) ~= nil or string.find(l_0_0, "\\inetpub\\wwwroot\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

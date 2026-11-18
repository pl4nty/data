-- Threat: !InfrastructureShared
-- Name: 1c29a5ef41a0
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, ".aspx", -5, true) and (string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\frontend\\") ~= nil or string.match(l_0_0, "\\microsoft\\exchange server\\v%d%d\\clientaccess\\") ~= nil or string.match(l_0_0, "\\microsoft shared\\web server extensions\\%d%d\\template\\layouts\\") ~= nil or string.find(l_0_0, "\\frontend\\httpproxy\\owa\\", 1, true) ~= nil or string.find(l_0_0, "\\inetpub\\wwwroot\\", 1, true) ~= nil) then
  mp.ReportLowfi(l_0_0, 1638888637)
  return mp.INFECTED
end
return mp.CLEAN

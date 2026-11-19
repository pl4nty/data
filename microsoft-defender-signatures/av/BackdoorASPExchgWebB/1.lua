-- Threat: Backdoor:ASP/ExchgWeb.B
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & AGGR:ProcessArtifacts.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "\\inetpub\\wwwroot\\", 1, true) ~= nil and IsExchangeServer() then
  return mp.INFECTED
end
return mp.CLEAN

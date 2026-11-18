-- Threat: !InfrastructureShared
-- Name: !#Lua:JS/Koadic.A!iecache
-- Type: 13
-- MpAttributes: SCRIPT:JS/Koadic.1 & SCRIPT:JS/Koadic.2 & SCRIPT:JS/Koadic.3 & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, "\\windows\\inetcache\\ie\\", 1, true) or string.find(l_0_0, "\\content.ie5\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 2f2973f4843e
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 and string.find(l_0_0, "/library/launchagents/com.apple.sysmond.plist", -45, true) then
  return mp.INFECTED
end
return mp.CLEAN

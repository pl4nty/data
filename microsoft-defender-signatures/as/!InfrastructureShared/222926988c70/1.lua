-- Threat: !InfrastructureShared
-- Name: 222926988c70
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if not l_0_0:find("impacket", 1, true) and not l_0_0:find("conficker", 1, true) and not l_0_0:find("\\salt", 1, true) and not l_0_0:find("metasploit", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

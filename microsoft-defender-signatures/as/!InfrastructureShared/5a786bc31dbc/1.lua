-- Threat: !InfrastructureShared
-- Name: 5a786bc31dbc
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 786432 then
  return mp.INFECTED
end
return mp.CLEAN

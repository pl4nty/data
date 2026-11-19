-- Threat: !InfrastructureShared
-- Name: 8b78416bdd63
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 <= 155000 and 150000 <= l_0_0 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

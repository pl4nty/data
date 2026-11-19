-- Threat: !InfrastructureShared
-- Name: ce78b60b34dc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 20783a9cbf23
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

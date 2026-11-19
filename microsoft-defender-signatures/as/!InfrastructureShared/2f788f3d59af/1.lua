-- Threat: !InfrastructureShared
-- Name: 2f788f3d59af
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

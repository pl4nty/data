-- Threat: !InfrastructureShared
-- Name: 317849a17f6e
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

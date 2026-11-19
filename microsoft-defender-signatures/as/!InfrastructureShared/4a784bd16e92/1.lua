-- Threat: !InfrastructureShared
-- Name: 4a784bd16e92
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

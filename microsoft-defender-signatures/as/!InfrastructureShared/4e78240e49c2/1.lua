-- Threat: !InfrastructureShared
-- Name: 4e78240e49c2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

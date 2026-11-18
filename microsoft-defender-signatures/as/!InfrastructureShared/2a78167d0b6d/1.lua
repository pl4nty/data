-- Threat: !InfrastructureShared
-- Name: 2a78167d0b6d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

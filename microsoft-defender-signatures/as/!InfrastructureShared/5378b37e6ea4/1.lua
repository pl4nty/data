-- Threat: !InfrastructureShared
-- Name: 5378b37e6ea4
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

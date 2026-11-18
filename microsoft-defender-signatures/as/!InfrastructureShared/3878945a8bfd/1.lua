-- Threat: !InfrastructureShared
-- Name: 3878945a8bfd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

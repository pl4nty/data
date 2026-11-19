-- Threat: !InfrastructureShared
-- Name: 607895d05a64
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 6f78c70b0801
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: cf78139cbe6c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

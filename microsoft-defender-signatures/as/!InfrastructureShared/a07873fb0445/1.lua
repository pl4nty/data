-- Threat: !InfrastructureShared
-- Name: a07873fb0445
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

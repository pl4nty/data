-- Threat: !InfrastructureShared
-- Name: d9784bc88cfb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

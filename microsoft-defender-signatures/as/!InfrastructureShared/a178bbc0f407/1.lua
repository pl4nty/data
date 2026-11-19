-- Threat: !InfrastructureShared
-- Name: a178bbc0f407
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

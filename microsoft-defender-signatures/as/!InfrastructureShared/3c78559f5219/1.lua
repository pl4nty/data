-- Threat: !InfrastructureShared
-- Name: 3c78559f5219
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

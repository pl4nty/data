-- Threat: !InfrastructureShared
-- Name: b278b32b84ad
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 7a7829116cfe
-- Type: 21

if peattributes.isexe == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN

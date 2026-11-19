-- Threat: !InfrastructureShared
-- Name: 2b781e89bae8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

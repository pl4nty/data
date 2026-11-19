-- Threat: !InfrastructureShared
-- Name: dc78f52c1fe1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

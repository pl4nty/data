-- Threat: !InfrastructureShared
-- Name: 38783d6b69a0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

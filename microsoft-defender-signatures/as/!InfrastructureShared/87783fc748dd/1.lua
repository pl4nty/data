-- Threat: !InfrastructureShared
-- Name: 87783fc748dd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 87783ad8717b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

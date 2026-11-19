-- Threat: !InfrastructureShared
-- Name: 12761cf2691f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

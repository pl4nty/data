-- Threat: !InfrastructureShared
-- Name: 5178f11869f9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

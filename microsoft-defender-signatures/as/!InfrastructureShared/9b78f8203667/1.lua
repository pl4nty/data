-- Threat: !InfrastructureShared
-- Name: 9b78f8203667
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

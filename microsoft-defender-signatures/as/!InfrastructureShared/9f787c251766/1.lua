-- Threat: !InfrastructureShared
-- Name: 9f787c251766
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 5e78c2e69b62
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

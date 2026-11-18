-- Threat: !InfrastructureShared
-- Name: 2c785d762e5e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 2c788e514839
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

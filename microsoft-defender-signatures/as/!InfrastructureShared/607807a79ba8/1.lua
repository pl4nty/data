-- Threat: !InfrastructureShared
-- Name: 607807a79ba8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 437841c68494
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

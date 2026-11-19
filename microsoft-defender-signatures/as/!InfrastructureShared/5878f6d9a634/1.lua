-- Threat: !InfrastructureShared
-- Name: 5878f6d9a634
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

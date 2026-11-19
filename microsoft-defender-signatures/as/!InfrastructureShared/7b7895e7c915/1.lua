-- Threat: !InfrastructureShared
-- Name: 7b7895e7c915
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

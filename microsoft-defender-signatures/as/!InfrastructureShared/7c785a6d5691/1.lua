-- Threat: !InfrastructureShared
-- Name: 7c785a6d5691
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

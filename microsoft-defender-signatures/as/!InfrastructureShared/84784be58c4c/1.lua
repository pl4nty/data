-- Threat: !InfrastructureShared
-- Name: 84784be58c4c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

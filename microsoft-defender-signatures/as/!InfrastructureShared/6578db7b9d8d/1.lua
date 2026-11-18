-- Threat: !InfrastructureShared
-- Name: 6578db7b9d8d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 7f78260e6a32
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

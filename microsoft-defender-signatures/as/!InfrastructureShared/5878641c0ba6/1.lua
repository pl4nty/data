-- Threat: !InfrastructureShared
-- Name: 5878641c0ba6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

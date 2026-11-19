-- Threat: !InfrastructureShared
-- Name: 8a78aabf5af0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

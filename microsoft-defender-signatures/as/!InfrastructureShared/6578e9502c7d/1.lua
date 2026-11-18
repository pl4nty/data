-- Threat: !InfrastructureShared
-- Name: 6578e9502c7d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

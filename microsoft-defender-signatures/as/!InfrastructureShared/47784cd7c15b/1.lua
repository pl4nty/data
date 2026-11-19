-- Threat: !InfrastructureShared
-- Name: 47784cd7c15b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

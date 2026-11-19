-- Threat: !InfrastructureShared
-- Name: 115407bc3254f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

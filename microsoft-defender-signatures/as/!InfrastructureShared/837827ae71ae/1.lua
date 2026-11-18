-- Threat: !InfrastructureShared
-- Name: 837827ae71ae
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

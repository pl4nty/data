-- Threat: !InfrastructureShared
-- Name: 11c78b6d5782f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

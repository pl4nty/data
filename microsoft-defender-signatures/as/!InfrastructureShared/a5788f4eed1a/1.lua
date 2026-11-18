-- Threat: !InfrastructureShared
-- Name: a5788f4eed1a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

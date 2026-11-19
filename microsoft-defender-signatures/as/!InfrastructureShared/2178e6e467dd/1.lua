-- Threat: !InfrastructureShared
-- Name: 2178e6e467dd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

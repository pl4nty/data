-- Threat: !InfrastructureShared
-- Name: 6878c85dc04b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

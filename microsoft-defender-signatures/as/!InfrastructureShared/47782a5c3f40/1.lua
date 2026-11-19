-- Threat: !InfrastructureShared
-- Name: 47782a5c3f40
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

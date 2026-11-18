-- Threat: !InfrastructureShared
-- Name: 24e780893ebbc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

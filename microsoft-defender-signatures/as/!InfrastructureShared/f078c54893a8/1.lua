-- Threat: !InfrastructureShared
-- Name: f078c54893a8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

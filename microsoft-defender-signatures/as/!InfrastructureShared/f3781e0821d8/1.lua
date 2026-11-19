-- Threat: !InfrastructureShared
-- Name: f3781e0821d8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

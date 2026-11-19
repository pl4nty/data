-- Threat: !InfrastructureShared
-- Name: e978c9d9f905
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

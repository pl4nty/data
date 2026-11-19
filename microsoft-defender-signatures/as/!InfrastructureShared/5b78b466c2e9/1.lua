-- Threat: !InfrastructureShared
-- Name: 5b78b466c2e9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

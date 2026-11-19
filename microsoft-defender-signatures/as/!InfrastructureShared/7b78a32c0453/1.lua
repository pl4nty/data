-- Threat: !InfrastructureShared
-- Name: 7b78a32c0453
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

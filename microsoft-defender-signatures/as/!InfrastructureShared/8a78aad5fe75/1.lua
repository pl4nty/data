-- Threat: !InfrastructureShared
-- Name: 8a78aad5fe75
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

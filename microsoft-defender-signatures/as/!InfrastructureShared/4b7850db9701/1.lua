-- Threat: !InfrastructureShared
-- Name: 4b7850db9701
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

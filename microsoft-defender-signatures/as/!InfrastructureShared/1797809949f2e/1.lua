-- Threat: !InfrastructureShared
-- Name: 1797809949f2e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

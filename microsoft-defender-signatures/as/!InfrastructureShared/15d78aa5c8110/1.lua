-- Threat: !InfrastructureShared
-- Name: 15d78aa5c8110
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

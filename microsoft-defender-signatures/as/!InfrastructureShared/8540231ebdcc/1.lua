-- Threat: !InfrastructureShared
-- Name: 8540231ebdcc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

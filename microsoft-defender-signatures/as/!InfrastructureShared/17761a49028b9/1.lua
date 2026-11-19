-- Threat: !InfrastructureShared
-- Name: 17761a49028b9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

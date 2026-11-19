-- Threat: !InfrastructureShared
-- Name: 4b78aa72310a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

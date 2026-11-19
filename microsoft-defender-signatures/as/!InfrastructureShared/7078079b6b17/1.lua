-- Threat: !InfrastructureShared
-- Name: 7078079b6b17
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

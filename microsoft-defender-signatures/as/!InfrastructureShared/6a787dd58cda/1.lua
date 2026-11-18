-- Threat: !InfrastructureShared
-- Name: 6a787dd58cda
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

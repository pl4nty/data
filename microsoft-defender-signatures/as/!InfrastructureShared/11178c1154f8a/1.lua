-- Threat: !InfrastructureShared
-- Name: 11178c1154f8a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

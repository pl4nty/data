-- Threat: !InfrastructureShared
-- Name: 6d785d88ffe6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

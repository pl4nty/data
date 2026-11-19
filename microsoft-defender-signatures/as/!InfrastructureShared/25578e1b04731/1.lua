-- Threat: !InfrastructureShared
-- Name: 25578e1b04731
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

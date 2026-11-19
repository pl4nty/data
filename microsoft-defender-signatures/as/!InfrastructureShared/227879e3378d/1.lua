-- Threat: !InfrastructureShared
-- Name: 227879e3378d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

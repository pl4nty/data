-- Threat: !InfrastructureShared
-- Name: 1d7844396bdc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

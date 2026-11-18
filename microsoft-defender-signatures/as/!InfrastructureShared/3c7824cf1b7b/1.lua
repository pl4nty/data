-- Threat: !InfrastructureShared
-- Name: 3c7824cf1b7b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

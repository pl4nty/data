-- Threat: !InfrastructureShared
-- Name: 8978a69f8b00
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

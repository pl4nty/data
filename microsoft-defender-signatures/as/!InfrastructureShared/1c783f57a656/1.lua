-- Threat: !InfrastructureShared
-- Name: 1c783f57a656
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

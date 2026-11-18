-- Threat: !InfrastructureShared
-- Name: a67855918656
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

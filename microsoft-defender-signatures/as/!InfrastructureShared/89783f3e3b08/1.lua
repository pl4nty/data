-- Threat: !InfrastructureShared
-- Name: 89783f3e3b08
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

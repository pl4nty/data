-- Threat: !InfrastructureShared
-- Name: 7a783c0a335c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

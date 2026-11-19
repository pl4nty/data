-- Threat: !InfrastructureShared
-- Name: 2717855a86c3b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

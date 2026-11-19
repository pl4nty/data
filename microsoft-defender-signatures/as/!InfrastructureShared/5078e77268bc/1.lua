-- Threat: !InfrastructureShared
-- Name: 5078e77268bc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

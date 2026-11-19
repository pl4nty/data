-- Threat: !InfrastructureShared
-- Name: 4e783c3172a2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

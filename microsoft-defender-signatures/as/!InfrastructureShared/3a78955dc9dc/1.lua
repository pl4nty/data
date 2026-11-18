-- Threat: !InfrastructureShared
-- Name: 3a78955dc9dc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

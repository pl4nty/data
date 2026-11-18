-- Threat: !InfrastructureShared
-- Name: b77895051af8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

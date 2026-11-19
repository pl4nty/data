-- Threat: !InfrastructureShared
-- Name: 44786b37723b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

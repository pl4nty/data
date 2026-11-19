-- Threat: !InfrastructureShared
-- Name: c5402d7fff4b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

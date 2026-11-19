-- Threat: !InfrastructureShared
-- Name: 54787b0c2ed0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

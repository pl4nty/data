-- Threat: !InfrastructureShared
-- Name: 4278392c5bdf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

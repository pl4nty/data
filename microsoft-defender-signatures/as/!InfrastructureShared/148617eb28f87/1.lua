-- Threat: !InfrastructureShared
-- Name: 148617eb28f87
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

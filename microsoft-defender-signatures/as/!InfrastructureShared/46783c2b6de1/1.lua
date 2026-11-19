-- Threat: !InfrastructureShared
-- Name: 46783c2b6de1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

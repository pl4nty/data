-- Threat: !InfrastructureShared
-- Name: 70789d7cb4aa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: e078467afa2c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

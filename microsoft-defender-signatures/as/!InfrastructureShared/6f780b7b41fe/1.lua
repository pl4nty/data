-- Threat: !InfrastructureShared
-- Name: 6f780b7b41fe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

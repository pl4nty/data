-- Threat: !InfrastructureShared
-- Name: b54039f76042
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 4a78650739fb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

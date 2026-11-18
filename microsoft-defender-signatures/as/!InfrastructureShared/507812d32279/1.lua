-- Threat: !InfrastructureShared
-- Name: 507812d32279
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

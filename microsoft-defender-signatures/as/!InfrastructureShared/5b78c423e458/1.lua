-- Threat: !InfrastructureShared
-- Name: 5b78c423e458
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

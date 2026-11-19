-- Threat: !InfrastructureShared
-- Name: 125783b56bd2e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

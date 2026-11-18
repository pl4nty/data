-- Threat: !InfrastructureShared
-- Name: 4e78e0a0ecc4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

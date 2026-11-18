-- Threat: !InfrastructureShared
-- Name: 2b787fe2c386
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

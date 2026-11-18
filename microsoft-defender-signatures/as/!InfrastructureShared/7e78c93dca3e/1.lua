-- Threat: !InfrastructureShared
-- Name: 7e78c93dca3e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

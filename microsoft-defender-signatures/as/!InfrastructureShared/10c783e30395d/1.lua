-- Threat: !InfrastructureShared
-- Name: 10c783e30395d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

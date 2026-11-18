-- Threat: !InfrastructureShared
-- Name: 22d613a334077
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

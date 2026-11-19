-- Threat: !InfrastructureShared
-- Name: 26178691817c8
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

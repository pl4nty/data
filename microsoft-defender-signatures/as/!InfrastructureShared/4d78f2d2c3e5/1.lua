-- Threat: !InfrastructureShared
-- Name: 4d78f2d2c3e5
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

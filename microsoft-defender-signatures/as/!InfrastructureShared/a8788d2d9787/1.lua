-- Threat: !InfrastructureShared
-- Name: a8788d2d9787
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

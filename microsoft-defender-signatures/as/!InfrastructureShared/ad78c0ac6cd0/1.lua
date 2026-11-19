-- Threat: !InfrastructureShared
-- Name: ad78c0ac6cd0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 4d78b11e131e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

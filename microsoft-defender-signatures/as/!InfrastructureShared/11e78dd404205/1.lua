-- Threat: !InfrastructureShared
-- Name: 11e78dd404205
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

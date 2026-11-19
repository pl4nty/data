-- Threat: !InfrastructureShared
-- Name: 717871c0ad1d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

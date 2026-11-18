-- Threat: !InfrastructureShared
-- Name: bb7847d95b1a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

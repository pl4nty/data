-- Threat: !InfrastructureShared
-- Name: 55788f583a11
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

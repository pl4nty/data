-- Threat: !InfrastructureShared
-- Name: 90780f9e7e38
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

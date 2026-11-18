-- Threat: !InfrastructureShared
-- Name: 41784e5dd069
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

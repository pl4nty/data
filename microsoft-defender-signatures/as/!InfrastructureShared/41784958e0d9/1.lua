-- Threat: !InfrastructureShared
-- Name: 41784958e0d9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

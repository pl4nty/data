-- Threat: !InfrastructureShared
-- Name: 20787d6e9ba1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

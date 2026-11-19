-- Threat: !InfrastructureShared
-- Name: 6078d4bb52f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

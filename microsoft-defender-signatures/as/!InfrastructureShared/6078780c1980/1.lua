-- Threat: !InfrastructureShared
-- Name: 6078780c1980
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

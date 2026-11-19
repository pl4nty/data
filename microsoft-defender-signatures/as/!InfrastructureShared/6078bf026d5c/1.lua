-- Threat: !InfrastructureShared
-- Name: 6078bf026d5c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

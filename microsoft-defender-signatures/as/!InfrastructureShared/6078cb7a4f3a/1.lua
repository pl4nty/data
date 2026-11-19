-- Threat: !InfrastructureShared
-- Name: 6078cb7a4f3a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 6078b5e3617b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 6e781cab72ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

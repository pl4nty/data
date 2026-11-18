-- Threat: !InfrastructureShared
-- Name: 6f78c9e3cf07
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

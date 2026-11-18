-- Threat: !InfrastructureShared
-- Name: 38789eb05005
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

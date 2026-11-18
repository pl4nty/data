-- Threat: !InfrastructureShared
-- Name: e4610467851b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

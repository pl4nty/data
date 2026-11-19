-- Threat: !InfrastructureShared
-- Name: 1d578b601106b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 38789a39fc88
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

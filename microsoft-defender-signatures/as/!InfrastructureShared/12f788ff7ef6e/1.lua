-- Threat: !InfrastructureShared
-- Name: 12f788ff7ef6e
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

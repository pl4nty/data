-- Threat: !InfrastructureShared
-- Name: 2f788ef620ae
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

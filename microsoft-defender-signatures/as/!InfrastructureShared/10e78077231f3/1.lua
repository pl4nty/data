-- Threat: !InfrastructureShared
-- Name: 10e78077231f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

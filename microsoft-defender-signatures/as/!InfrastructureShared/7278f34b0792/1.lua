-- Threat: !InfrastructureShared
-- Name: 7278f34b0792
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

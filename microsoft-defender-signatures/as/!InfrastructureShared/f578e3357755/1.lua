-- Threat: !InfrastructureShared
-- Name: f578e3357755
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

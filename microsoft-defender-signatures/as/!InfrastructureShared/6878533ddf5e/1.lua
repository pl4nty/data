-- Threat: !InfrastructureShared
-- Name: 6878533ddf5e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

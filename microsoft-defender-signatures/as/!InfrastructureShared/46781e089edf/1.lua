-- Threat: !InfrastructureShared
-- Name: 46781e089edf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1d785e465e3e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

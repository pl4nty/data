-- Threat: !InfrastructureShared
-- Name: 69781f923480
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

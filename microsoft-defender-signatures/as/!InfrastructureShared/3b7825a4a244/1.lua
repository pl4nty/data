-- Threat: !InfrastructureShared
-- Name: 3b7825a4a244
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

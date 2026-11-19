-- Threat: !InfrastructureShared
-- Name: 9c78278f626e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

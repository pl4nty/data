-- Threat: !InfrastructureShared
-- Name: 43611a3661ff
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN

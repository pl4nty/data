-- Threat: !InfrastructureShared
-- Name: e5406deb2de9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

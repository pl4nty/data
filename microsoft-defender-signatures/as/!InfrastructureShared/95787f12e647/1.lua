-- Threat: !InfrastructureShared
-- Name: 95787f12e647
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

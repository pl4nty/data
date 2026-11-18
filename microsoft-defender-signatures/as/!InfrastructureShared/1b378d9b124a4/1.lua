-- Threat: !InfrastructureShared
-- Name: 1b378d9b124a4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

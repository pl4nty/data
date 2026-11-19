-- Threat: !InfrastructureShared
-- Name: b378f0738762
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

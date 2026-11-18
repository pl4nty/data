-- Threat: !InfrastructureShared
-- Name: b378c2a40ef9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

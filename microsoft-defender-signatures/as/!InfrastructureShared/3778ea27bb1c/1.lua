-- Threat: !InfrastructureShared
-- Name: 3778ea27bb1c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

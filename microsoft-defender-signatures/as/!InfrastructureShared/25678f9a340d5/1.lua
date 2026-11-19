-- Threat: !InfrastructureShared
-- Name: 25678f9a340d5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

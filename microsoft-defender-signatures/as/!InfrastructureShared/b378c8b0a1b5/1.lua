-- Threat: !InfrastructureShared
-- Name: b378c8b0a1b5
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

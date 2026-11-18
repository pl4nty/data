-- Threat: !InfrastructureShared
-- Name: b378c195ad93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

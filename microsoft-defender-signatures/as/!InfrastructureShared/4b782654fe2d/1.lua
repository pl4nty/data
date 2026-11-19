-- Threat: !InfrastructureShared
-- Name: 4b782654fe2d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

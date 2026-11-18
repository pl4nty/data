-- Threat: !InfrastructureShared
-- Name: 4a788de17640
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 7878bb4aa7f5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

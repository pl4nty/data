-- Threat: !InfrastructureShared
-- Name: 6178755d8c27
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: b778faa0c916
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

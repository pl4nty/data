-- Threat: !InfrastructureShared
-- Name: 5578d824ef2e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

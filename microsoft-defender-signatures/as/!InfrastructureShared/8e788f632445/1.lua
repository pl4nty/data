-- Threat: !InfrastructureShared
-- Name: 8e788f632445
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

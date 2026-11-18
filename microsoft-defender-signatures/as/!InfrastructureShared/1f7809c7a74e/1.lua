-- Threat: !InfrastructureShared
-- Name: 1f7809c7a74e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

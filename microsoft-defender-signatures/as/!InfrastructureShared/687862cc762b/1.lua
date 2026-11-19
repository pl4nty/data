-- Threat: !InfrastructureShared
-- Name: 687862cc762b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

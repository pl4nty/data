-- Threat: !InfrastructureShared
-- Name: e5402bc0e301
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

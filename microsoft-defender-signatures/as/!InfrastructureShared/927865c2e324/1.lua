-- Threat: !InfrastructureShared
-- Name: 927865c2e324
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 12f7852565a2e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

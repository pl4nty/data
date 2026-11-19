-- Threat: !InfrastructureShared
-- Name: 70784b2e6b5a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

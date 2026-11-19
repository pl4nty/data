-- Threat: !InfrastructureShared
-- Name: 367861abafdb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 15540b74f5c47
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

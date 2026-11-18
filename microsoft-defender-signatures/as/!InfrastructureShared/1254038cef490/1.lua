-- Threat: !InfrastructureShared
-- Name: 1254038cef490
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

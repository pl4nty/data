-- Threat: !InfrastructureShared
-- Name: 3a78cba1e873
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

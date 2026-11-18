-- Threat: !InfrastructureShared
-- Name: 5a78c9100b70
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 3a78e5ce051f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

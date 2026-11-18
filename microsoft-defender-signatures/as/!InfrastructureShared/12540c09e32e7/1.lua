-- Threat: !InfrastructureShared
-- Name: 12540c09e32e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

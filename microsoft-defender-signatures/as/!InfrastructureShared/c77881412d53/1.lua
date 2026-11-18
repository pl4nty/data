-- Threat: !InfrastructureShared
-- Name: c77881412d53
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 172780e90fd53
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

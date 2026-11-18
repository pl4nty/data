-- Threat: !InfrastructureShared
-- Name: 807868933f09
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

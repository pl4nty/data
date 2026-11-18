-- Threat: !InfrastructureShared
-- Name: 2f780ddfc2f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

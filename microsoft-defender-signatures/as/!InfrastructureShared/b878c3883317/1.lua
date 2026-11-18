-- Threat: !InfrastructureShared
-- Name: b878c3883317
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

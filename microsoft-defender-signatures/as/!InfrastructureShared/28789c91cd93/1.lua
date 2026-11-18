-- Threat: !InfrastructureShared
-- Name: 28789c91cd93
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

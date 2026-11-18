-- Threat: !InfrastructureShared
-- Name: 33785ce2ccfc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: a478761453fe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

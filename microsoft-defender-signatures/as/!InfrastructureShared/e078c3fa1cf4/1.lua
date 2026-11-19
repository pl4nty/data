-- Threat: !InfrastructureShared
-- Name: e078c3fa1cf4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN

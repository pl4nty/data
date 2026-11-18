-- Threat: !InfrastructureShared
-- Name: 10578b0764163
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

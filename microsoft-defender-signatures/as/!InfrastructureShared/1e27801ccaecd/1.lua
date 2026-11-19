-- Threat: !InfrastructureShared
-- Name: 1e27801ccaecd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

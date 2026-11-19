-- Threat: !InfrastructureShared
-- Name: 1407830c3a85b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

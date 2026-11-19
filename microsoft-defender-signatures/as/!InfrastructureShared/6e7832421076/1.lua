-- Threat: !InfrastructureShared
-- Name: 6e7832421076
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

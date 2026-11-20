-- Threat: !InfrastructureShared
-- Name: 3278071750f6
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN

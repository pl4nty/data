-- Threat: !InfrastructureShared
-- Name: b978ea0f98e0
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

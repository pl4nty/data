-- Threat: !InfrastructureShared
-- Name: d0788e9e71df
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

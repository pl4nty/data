-- Threat: !InfrastructureShared
-- Name: e6784d2bcd61
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1387899e7d79d
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN

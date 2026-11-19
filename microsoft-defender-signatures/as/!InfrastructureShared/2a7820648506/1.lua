-- Threat: !InfrastructureShared
-- Name: 2a7820648506
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

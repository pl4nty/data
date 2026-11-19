-- Threat: !InfrastructureShared
-- Name: 10578d0faa304
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

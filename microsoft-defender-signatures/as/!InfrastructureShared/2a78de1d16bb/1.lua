-- Threat: !InfrastructureShared
-- Name: 2a78de1d16bb
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

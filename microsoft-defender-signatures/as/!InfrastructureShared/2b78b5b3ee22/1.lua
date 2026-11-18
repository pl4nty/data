-- Threat: !InfrastructureShared
-- Name: 2b78b5b3ee22
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 2a78f77a476a
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

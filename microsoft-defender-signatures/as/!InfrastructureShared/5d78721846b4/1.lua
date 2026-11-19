-- Threat: !InfrastructureShared
-- Name: 5d78721846b4
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

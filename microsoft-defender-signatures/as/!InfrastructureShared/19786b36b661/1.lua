-- Threat: !InfrastructureShared
-- Name: 19786b36b661
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN

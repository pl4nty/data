-- Threat: !InfrastructureShared
-- Name: 1b78848c8fcc
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN

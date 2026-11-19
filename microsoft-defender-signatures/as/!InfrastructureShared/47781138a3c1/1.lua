-- Threat: !InfrastructureShared
-- Name: 47781138a3c1
-- Type: 21

if peattributes.x86_image and peattributes.isexe and peattributes.lastscn_writable and peattributes.lastscn_executable then
  return mp.INFECTED
end
return mp.CLEAN

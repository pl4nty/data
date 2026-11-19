-- Threat: !InfrastructureShared
-- Name: 5d788c7719f3
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

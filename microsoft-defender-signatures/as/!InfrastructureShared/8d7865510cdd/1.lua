-- Threat: !InfrastructureShared
-- Name: 8d7865510cdd
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN

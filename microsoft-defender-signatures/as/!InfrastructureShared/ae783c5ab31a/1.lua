-- Threat: !InfrastructureShared
-- Name: ae783c5ab31a
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

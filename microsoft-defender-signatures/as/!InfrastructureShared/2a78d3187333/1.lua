-- Threat: !InfrastructureShared
-- Name: 2a78d3187333
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

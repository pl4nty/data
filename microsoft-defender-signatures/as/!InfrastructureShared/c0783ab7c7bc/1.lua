-- Threat: !InfrastructureShared
-- Name: c0783ab7c7bc
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

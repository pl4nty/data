-- Threat: !InfrastructureShared
-- Name: 3b7865c0c9de
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

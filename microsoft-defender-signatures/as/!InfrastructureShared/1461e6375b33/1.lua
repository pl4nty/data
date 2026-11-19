-- Threat: !InfrastructureShared
-- Name: 1461e6375b33
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true and peattributes.hasexports == true and peattributes.epinfirstsect == true and peattributes.no_security == true and peattributes.no_debug == true then
  return mp.INFECTED
end
return mp.CLEAN

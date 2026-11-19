-- Threat: !InfrastructureShared
-- Name: a378cd74929a
-- Type: 21

if peattributes.x86_image == true and (peattributes.isexe == true or peattributes.isdll == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

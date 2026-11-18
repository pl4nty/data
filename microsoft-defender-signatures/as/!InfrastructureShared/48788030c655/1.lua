-- Threat: !InfrastructureShared
-- Name: 48788030c655
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

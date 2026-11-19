-- Threat: !InfrastructureShared
-- Name: 39a782fbf3d23
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN

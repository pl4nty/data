-- Threat: !InfrastructureShared
-- Name: 4178bfd73e1b
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

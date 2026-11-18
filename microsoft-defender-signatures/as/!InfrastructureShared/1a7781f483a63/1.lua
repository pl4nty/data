-- Threat: !InfrastructureShared
-- Name: 1a7781f483a63
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN

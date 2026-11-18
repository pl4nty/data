-- Threat: !InfrastructureShared
-- Name: 58784b64649c
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

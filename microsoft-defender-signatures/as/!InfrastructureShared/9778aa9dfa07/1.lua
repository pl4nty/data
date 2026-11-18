-- Threat: !InfrastructureShared
-- Name: 9778aa9dfa07
-- Type: 21

if peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN

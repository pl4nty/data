-- Threat: !InfrastructureShared
-- Name: 7578d56f809e
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

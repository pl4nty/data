-- Threat: !InfrastructureShared
-- Name: 2f7872bae292
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 754046ff2eaa
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN

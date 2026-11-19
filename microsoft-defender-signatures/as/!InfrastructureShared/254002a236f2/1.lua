-- Threat: !InfrastructureShared
-- Name: 254002a236f2
-- Type: 21

if mp.get_mpattribute("MpCPlApplet") then
  return mp.INFECTED
end
return mp.CLEAN

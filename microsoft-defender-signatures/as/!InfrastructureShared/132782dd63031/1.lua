-- Threat: !InfrastructureShared
-- Name: 132782dd63031
-- Type: 21

if mp.get_mpattribute("BM_MpIsInstaller") and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 31788c5e42da
-- Type: 21

if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:Issuer.Microsoft") then
  mp.changedetectionname(3072529589)
end
return mp.INFECTED

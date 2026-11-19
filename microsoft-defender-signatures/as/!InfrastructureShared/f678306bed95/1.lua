-- Threat: !InfrastructureShared
-- Name: f678306bed95
-- Type: 21

if peattributes.isexe == false then
  return mp.CLEAN
end
mp.set_mpattribute("PUA:HSTR:OnePlatformInstaller")
return mp.INFECTED

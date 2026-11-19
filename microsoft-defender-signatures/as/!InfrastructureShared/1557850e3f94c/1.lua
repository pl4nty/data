-- Threat: !InfrastructureShared
-- Name: 1557850e3f94c
-- Type: 21

if peattributes.isexe == false then
  return mp.CLEAN
end
mp.set_mpattribute("PUA:Block:BitComet_BundleInstaller")
return mp.INFECTED

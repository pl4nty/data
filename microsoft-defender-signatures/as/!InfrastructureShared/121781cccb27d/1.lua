-- Threat: !InfrastructureShared
-- Name: 121781cccb27d
-- Type: 21

if mp.get_mpattribute("HSTR:MSIL/Obfuscator.Deepsea.D") then
  return mp.INFECTED
end
return mp.CLEAN

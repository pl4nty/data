-- Threat: !InfrastructureShared
-- Name: 2778368b8ac6
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 600000 then
  return mp.SUSPICIOUS
end
mp.set_mpattribute("HSTR:Obfuscator_CheckApiArtifact2")
return mp.CLEAN

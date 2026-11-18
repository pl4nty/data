-- Threat: !InfrastructureShared
-- Name: a07888c16e28
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("FOP:Rijndael") then
  return mp.SUSPICIOUS
end
return mp.CLEAN

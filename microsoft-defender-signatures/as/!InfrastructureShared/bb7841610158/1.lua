-- Threat: !InfrastructureShared
-- Name: bb7841610158
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 1 then
  mp.set_mpattribute("CRUMCryptor")
end
if mp.HSTR_WEIGHT >= 2 then
  return mp.SUSPICIOUS
end
return mp.CLEAN

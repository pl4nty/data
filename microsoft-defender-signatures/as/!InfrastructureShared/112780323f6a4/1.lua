-- Threat: !InfrastructureShared
-- Name: 112780323f6a4
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("RPF:CarberpVncDLL") or hstrlog[5].matched then
  mp.changedetectionname(805306440)
  return mp.INFECTED
end
return mp.SUSPICIOUS

-- Threat: !InfrastructureShared
-- Name: 9d78e68f5efb
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("RPF:CarberpVncDLL") or hstrlog[5].matched then
  mp.changedetectionname(805306413)
  return mp.INFECTED
end
return mp.SUSPICIOUS

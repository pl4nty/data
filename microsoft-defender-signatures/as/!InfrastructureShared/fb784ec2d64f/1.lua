-- Threat: !InfrastructureShared
-- Name: fb784ec2d64f
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 11 and (hstrlog[1].matched or hstrlog[2].matched) then
  return mp.INFECTED
else
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN

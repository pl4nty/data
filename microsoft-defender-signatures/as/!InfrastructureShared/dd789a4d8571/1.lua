-- Threat: !InfrastructureShared
-- Name: dd789a4d8571
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 then
  return mp.SUSPICIOUS
else
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.LOWFI

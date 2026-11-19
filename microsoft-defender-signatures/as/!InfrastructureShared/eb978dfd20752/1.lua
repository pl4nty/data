-- Threat: !InfrastructureShared
-- Name: eb978dfd20752
-- Type: 21
-- Flags: 1

mp.set_mpattribute("HSTR:Virtool:Win32/Obfuscator.ACP")
if mp.HSTR_WEIGHT > 1 then
  return mp.SUSPICIOUS
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN

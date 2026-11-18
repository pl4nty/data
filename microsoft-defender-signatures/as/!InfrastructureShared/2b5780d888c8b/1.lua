-- Threat: !InfrastructureShared
-- Name: 2b5780d888c8b
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("HSTR:Trojan:Win32/Tracur_01")
end
mp.set_mpattribute("do_deep_rescan")
return mp.INFECTED

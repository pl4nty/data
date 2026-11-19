-- Threat: !InfrastructureShared
-- Name: 11ef78573249c4
-- Type: 21

if mp.HSTR_WEIGHT == 1 then
  mp.set_mpattribute("HSTR:Trojan:Win32/Sodebral.A1")
end
return mp.INFECTED

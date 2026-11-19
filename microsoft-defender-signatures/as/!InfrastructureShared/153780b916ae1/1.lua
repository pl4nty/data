-- Threat: !InfrastructureShared
-- Name: 153780b916ae1
-- Type: 21

if mp.HSTR_WEIGHT < 8 and mp.HSTR_WEIGHT > 1 then
  mp.set_mpattribute("HSTR:Trojan:Win32/Emotet.M1")
end
return mp.INFECTED

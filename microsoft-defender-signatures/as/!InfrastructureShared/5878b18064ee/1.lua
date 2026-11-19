-- Threat: !InfrastructureShared
-- Name: 5878b18064ee
-- Type: 21

if mp.get_mpattribute("SIGATTR:Trojan:Win32/C2Lop.gen!G") and mp.get_mpattribute("HSTR:HasSEH") then
  return mp.SUSPICIOUS
end
return mp.CLEAN

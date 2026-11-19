-- Threat: !InfrastructureShared
-- Name: 3861cf76a0dc
-- Type: 21

if mp.get_mpattribute("HSTR:Trojan:Win32/IsDelphi") then
  return mp.INFECTED
end
return mp.CLEAN

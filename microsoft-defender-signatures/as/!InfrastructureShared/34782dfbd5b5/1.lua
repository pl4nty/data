-- Threat: !InfrastructureShared
-- Name: 34782dfbd5b5
-- Type: 21

if mp.get_mpattribute("ALF:HeraklezEval:Trojan:Win32/Qakbot.SD!rfn") then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 1e618695e34d
-- Type: 21

if mp.get_mpattribute("ALF:HeraklezEval:Trojan:Win32/Qakbot.SD!rfn") then
  return mp.INFECTED
end
return mp.CLEAN

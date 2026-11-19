-- Threat: !InfrastructureShared
-- Name: 95780f5702ac
-- Type: 21

if mp.get_mpattribute("SIGATTR:TrojanProxy:Win32/Dorando.gen!B") then
  return mp.INFECTED
end
return mp.CLEAN

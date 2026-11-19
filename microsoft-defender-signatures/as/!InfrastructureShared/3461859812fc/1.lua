-- Threat: !InfrastructureShared
-- Name: 3461859812fc
-- Type: 21

if mp.get_mpattribute("Sigattr:TrojanSpy:Win32/Banker.gen!E.1") then
  return mp.INFECTED
end
return mp.CLEAN

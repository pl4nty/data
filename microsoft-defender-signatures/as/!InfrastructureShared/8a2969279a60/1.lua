-- Threat: !InfrastructureShared
-- Name: 8a2969279a60
-- Type: 21

if not mp.get_mpattribute("SCRIPT:PythonCode.A") then
  return mp.INFECTED
end
return mp.LOWFI

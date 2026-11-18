-- Threat: !InfrastructureShared
-- Name: 71297f119c6c
-- Type: 21

if not mp.get_mpattribute("SCRIPT:PythonCode.A") then
  return mp.INFECTED
end
return mp.LOWFI

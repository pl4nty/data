-- Threat: !InfrastructureShared
-- Name: 4e29b514cb9e
-- Type: 21

if not mp.get_mpattribute("SCRIPT:PythonCode.A") then
  return mp.INFECTED
end
return mp.LOWFI

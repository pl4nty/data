-- Threat: !InfrastructureShared
-- Name: 8029e5387b91
-- Type: 21

if not mp.get_mpattribute("SCRIPT:PythonCode.A") then
  return mp.INFECTED
end
return mp.LOWFI

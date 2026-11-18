-- Threat: !InfrastructureShared
-- Name: 88615a3f0dd5
-- Type: 21

if mp.get_mpattribute("SIGATTR:Ransom:Win32/Sodin") then
  return mp.INFECTED
end
return mp.CLEAN

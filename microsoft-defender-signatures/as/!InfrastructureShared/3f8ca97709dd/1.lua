-- Threat: !InfrastructureShared
-- Name: 3f8ca97709dd
-- Type: 21

if mp.get_mpattribute("Detection:Backdoor:Linux/Rekobee") then
  return mp.CLEAN
end
return mp.INFECTED

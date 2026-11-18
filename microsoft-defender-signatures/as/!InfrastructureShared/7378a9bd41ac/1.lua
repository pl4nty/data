-- Threat: !InfrastructureShared
-- Name: 7378a9bd41ac
-- Type: 21

if mp.get_mpattribute("SIGATTR:MadCodeHook") then
  return mp.INFECTED
end
return mp.CLEAN

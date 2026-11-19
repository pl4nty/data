-- Threat: !InfrastructureShared
-- Name: d95dd5e1135
-- Type: 21

if mp.get_mpattribute("CallsZwQuerySystemInformation") then
  mp.set_mpattribute("PEBMPAT:AntiEmuGetCopyOnWriteCount")
end
return mp.CLEAN

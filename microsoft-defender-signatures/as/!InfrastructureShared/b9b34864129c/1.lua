-- Threat: !InfrastructureShared
-- Name: b9b34864129c
-- Type: 21

if versioning.GetEngineBuild() >= 16700 then
  local l_0_0 = versioning.GetOrgID()
  if l_0_0 and string.lower(l_0_0) == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
    return mp.CLEAN
  end
end
return mp.INFECTED

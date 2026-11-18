-- Threat: !InfrastructureShared
-- Name: 6978bff1cd78
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if l_0_0 == "7ce057ac-e3c0-4972-8008-75f919595b9d" or l_0_0 == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
    return mp.INFECTED
  end
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: df78c05fc0a7
-- Type: 21

local l_0_0 = versioning.GetOrgID()
local l_0_1 = {
  ["34b009bc-d82c-4be9-aa2c-9a60d609ae93"] = true
}
if l_0_0 ~= nil and l_0_1[l_0_0] == true then
  return mp.INFECTED
end
return mp.CLEAN

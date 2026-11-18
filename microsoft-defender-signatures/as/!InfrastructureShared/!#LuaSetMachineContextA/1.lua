-- Threat: !InfrastructureShared
-- Name: !#Lua:SetMachineContext.A
-- Type: 12

local l_0_0 = mp.GetMachineGUID()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = crypto.Sha1Buffer(l_0_0, 0, #l_0_0)
  if l_0_1 ~= nil then
    local l_0_2 = "Lua:Machine!PII_" .. l_0_1
    mp.set_mpattribute(l_0_2)
  end
end
local l_0_3 = versioning.GetOrgID()
if l_0_3 ~= nil then
  l_0_3 = string.lower(l_0_3)
  local l_0_4 = crypto.Sha1Buffer(l_0_3, 0, #l_0_3)
  if l_0_4 ~= nil then
    local l_0_5 = "Lua:OrgId!PII_" .. l_0_4
    mp.set_mpattribute(l_0_5)
  end
end
return mp.CLEAN

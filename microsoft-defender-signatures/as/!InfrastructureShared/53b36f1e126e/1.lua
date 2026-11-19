-- Threat: !InfrastructureShared
-- Name: 53b36f1e126e
-- Type: 21

local l_0_0
local l_0_1 = "base64_plist_creation"
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1:match("([^/]+)$")
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1:match("([^/]+)$")
end
if l_0_0 ~= nil and l_0_0 ~= "" then
  if MpCommon.GetPersistContextCountNoPath(l_0_1) > 0 then
    MpCommon.AppendPersistContextNoPath(l_0_1, l_0_0, 3600)
  else
    local l_0_2 = {}
    l_0_2[1] = l_0_0
    MpCommon.SetPersistContextNoPath(l_0_1, l_0_2, 3600)
  end
  return mp.INFECTED
end
return mp.CLEAN

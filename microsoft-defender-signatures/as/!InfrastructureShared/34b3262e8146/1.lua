-- Threat: !InfrastructureShared
-- Name: 34b3262e8146
-- Type: 21

local l_0_0
local l_0_1 = "base64_plist_creation"
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and MpCommon.GetPersistContextCountNoPath(l_0_1) > 0 then
  local l_0_2 = MpCommon.GetPersistContextNoPath(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if string.find(l_0_0, l_0_4, 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

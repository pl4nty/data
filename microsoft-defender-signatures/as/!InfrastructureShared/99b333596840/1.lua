-- Threat: !InfrastructureShared
-- Name: 99b333596840
-- Type: 21
-- Includes: PeParser, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_0:match("(%w+%.exe)$")
local l_0_2 = GetRollingQueueKeyValue("app_version_" .. l_0_1, l_0_0)
if l_0_2 == nil then
  local l_0_3 = sysio.GetPEFixedVersionInfo(l_0_0)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = "app_version_" .. l_0_1
  local l_0_5 = 31536000
  local l_0_6 = 50
  if l_0_3.FileVersion ~= 0 then
    local l_0_7 = Version_to_str(l_0_3.FileVersion)
    AppendToRollingQueue(l_0_4, l_0_0, l_0_7, l_0_5, l_0_6)
    bm.add_related_string("SQLVersion", l_0_7, bm.RelatedStringBMReport)
  else
    bm.add_related_string("SQLVersion", "ERROR", bm.RelatedStringBMReport)
  end
else
  bm.add_related_string("SQLVersion", l_0_2, bm.RelatedStringBMReport)
end
return mp.INFECTED

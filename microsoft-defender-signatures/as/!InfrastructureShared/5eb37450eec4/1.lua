-- Threat: !InfrastructureShared
-- Name: 5eb37450eec4
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
local l_0_1 = false
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p1 ~= nil then
    local l_0_2 = string.lower(this_sigattrlog[1].utf8p1)
    if StringStartsWith(l_0_2, "\\device\\harddiskvolumeshadowcopy") or string.find(l_0_2, "\\microsoft\\onedrive\\", 1, true) ~= nil or string.find(l_0_2, "\\microsoft onedrive\\", 1, true) ~= nil then
      return mp.CLEAN
    end
  end
  if this_sigattrlog[1].utf8p2 ~= nil then
    l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
    if not sysio.IsFileExists(l_0_0) then
      return mp.CLEAN
    end
    local l_0_3 = mp.IsKnownFriendlyFile(l_0_0, true, false)
    if l_0_3 == true then
      return mp.CLEAN
    end
    local l_0_4 = sysio.GetPEVersionInfo(l_0_0)
    local l_0_5 = l_0_4 and l_0_4.OriginalFilename
    if l_0_4 == nil or l_0_5 == nil or string.lower(l_0_5) ~= "filesyncclient.dll" then
      l_0_1 = true
    end
  end
end
if l_0_1 == true and l_0_0 ~= nil then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN

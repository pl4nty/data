-- Threat: !InfrastructureShared
-- Name: 4bb39f8a87f4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil or #l_0_0 < 12 then
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(l_0_0, "SystemDropToUserProfile.A") then
  local l_0_1 = {
    "psexesvc.exe",
    "wmiprvse.exe",
    "wmic.exe"
  }
  if IsProcNameInParentProcessTree("BM", l_0_1) then
    return mp.INFECTED
  end
end
return mp.CLEAN

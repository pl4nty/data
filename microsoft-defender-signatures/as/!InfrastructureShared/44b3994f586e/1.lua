-- Threat: !InfrastructureShared
-- Name: 44b3994f586e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil or #l_0_0 < 12 then
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_2
if l_0_1 then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if string.find(l_0_4, ":\\users\\", 1, true) and MpCommon.QueryPersistContext(l_0_4, "SystemDropToUserProfile.A") then
      l_0_2 = l_0_4
      break
    end
  end
end
if l_0_2 == nil or #l_0_2 < 12 then
  return mp.CLEAN
end
local l_0_5 = {
  "psexesvc.exe",
  "wmiprvse.exe",
  "wmic.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_5) then
  return mp.INFECTED
end
return mp.CLEAN

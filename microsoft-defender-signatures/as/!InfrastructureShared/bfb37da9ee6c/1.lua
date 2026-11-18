-- Threat: !InfrastructureShared
-- Name: bfb37da9ee6c
-- Type: 21
-- Includes: TechniqueTracker, HvaLookupHelpers

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
end
if l_0_0 ~= nil and string.find(l_0_0, "ifm", 1, true) and (string.find(l_0_0, "activate ", 1, true) or string.find(l_0_0, "ac ", 1, true) or string.find(l_0_0, "act ", 1, true)) and (string.find(l_0_0, "instance ", 1, true) or string.find(l_0_0, "in ", 1, true) or string.find(l_0_0, "i ", 1, true) or string.find(l_0_0, "inst ", 1, true)) and (string.find(l_0_0, "create full", 1, true) or string.find(l_0_0, "cr fu", 1, true)) then
  local l_0_1 = {
    "wsmprovhost.exe",
    "wmiprvse.exe",
    "explorer.exe"
  }
  if IsProcNameInParentProcessTree("BM", l_0_1) and IsDeviceHVA() then
    local l_0_2 = ExtractDeviceProperties()
    if l_0_2.DeviceRoles and l_0_2.DeviceRoles.DomainController ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

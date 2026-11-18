-- Threat: !InfrastructureShared
-- Name: 8bd7ed2d3bdf
-- Type: 21
-- Includes: TechniqueTracker, HvaLookupHelpers

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0 ~= nil and l_0_0.DeviceRoles ~= nil then
    local l_0_1 = {
      "winrshost.exe",
      "wsmprovhost.exe",
      "wmiprvse.exe",
      "rundll32.exe"
    }
    if IsProcNameInParentProcessTree("cmdhstr", l_0_1) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

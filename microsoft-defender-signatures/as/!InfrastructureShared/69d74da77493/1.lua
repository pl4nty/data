-- Threat: !InfrastructureShared
-- Name: 69d74da77493
-- Type: 21
-- Includes: TechniqueTracker, HvaLookupHelpers

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles ~= nil then
    if IsProcNameInParentProcessTree("cmdhstr", "ltsvc.exe") then
      return mp.CLEAN
    end
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

-- Threat: !InfrastructureShared
-- Name: 3dd7f063ccef
-- Type: 21
-- Includes: HvaLookupHelpers

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and string.find(l_0_0.image_path, "/java", -5, true) and IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: 239d75d610a51
-- Type: 21
-- Includes: BMLuaLib, HvaLookupHelpers

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  if l_0_2 == "w3wp.exe" and IsDeviceHVA() then
    local l_0_3 = ""
    local l_0_4 = ExtractDeviceProperties()
    if l_0_4.DeviceRoles ~= nil and l_0_4.IsInternetFacing == true then
      for l_0_5, l_0_6 in pairs(l_0_4.DeviceRoles) do
        l_0_3 = l_0_3 .. ";" .. l_0_5
      end
      MpCommon.BmTriggerSig(l_0_0.ppid, "HvaRoles!WebSever", l_0_3)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

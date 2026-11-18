-- Threat: !InfrastructureShared
-- Name: 14ab3d21a8786
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "TamperLoaderPatch"
local l_0_1 = "T1562.002"
local l_0_2 = "ntdll.dll"
local l_0_3 = {"LdrLoadDll"}
local l_0_4 = 10
local l_0_5, l_0_6, l_0_7 = helper_tamperapi_setup(nil, l_0_0)
if isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8, l_0_9 = found_api_tampering(l_0_5, l_0_6, l_0_7, l_0_2, nil, l_0_3, nil, l_0_4, l_0_0, l_0_1)
local l_0_10 = {
  ["program files"] = true,
  ["program files (x86)"] = true
}
local l_0_11 = string.lower(string.match(MpCommon.PathToWin32Path(bm.get_imagepath()), ":[/\\](.-)[/\\]") or "")
if l_0_8 and (l_0_9 ~= "KnownBad" or isnull(l_0_10[l_0_11])) then
  return mp.INFECTED
elseif l_0_8 then
  bm.trigger_sig("Loader_Patch.Tel.B", l_0_9)
end
return mp.CLEAN

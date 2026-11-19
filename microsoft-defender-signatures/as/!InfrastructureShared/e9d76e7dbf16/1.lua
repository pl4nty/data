-- Threat: !InfrastructureShared
-- Name: e9d76e7dbf16
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 then
  local l_0_1 = l_0_0.image_path
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_1))
  local l_0_2 = StringSplit(l_0_1, "\\")
  if #l_0_2 < 7 then
    return mp.CLEAN
  end
  local l_0_3 = {
    ["lgpo.exe"] = true,
    ["powershell.exe"] = true
  }
  if l_0_3[l_0_2[#l_0_2]] then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

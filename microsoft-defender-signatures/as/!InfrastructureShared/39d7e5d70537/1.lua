-- Threat: !InfrastructureShared
-- Name: 39d7e5d70537
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "psexesvc.exe", 1, true) then
  return mp.CLEAN
end
if IsKeyInRollingQueue("file_remote_dropped", l_0_2, true) then
  local l_0_3 = mp.GetParentProcInfo()
  if not isnull(l_0_3) then
    local l_0_4 = string.lower(l_0_3.image_path or "")
    if l_0_4:match("([^\\]+)$") == "services.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

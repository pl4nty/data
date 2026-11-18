-- Threat: !InfrastructureShared
-- Name: 3ed78fa288ce
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) then
  local l_0_1 = string.lower(string.sub(l_0_0.image_path, -14))
  if l_0_1 == "powershell.exe" then
    local l_0_2 = mp.GetScannedPPID()
    if l_0_2 == nil then
      return mp.CLEAN
    end
    local l_0_3 = mp.GetProcessCommandLine(l_0_2)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    if StringEndsWith(string.lower(l_0_3), ".jsc") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

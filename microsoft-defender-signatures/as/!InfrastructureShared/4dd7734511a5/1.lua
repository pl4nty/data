-- Threat: !InfrastructureShared
-- Name: 4dd7734511a5
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.image_path and string.lower(l_0_0.image_path)
if l_0_1 == nil or #l_0_1 <= 7 then
  return mp.CLEAN
end
if StringEndsWith(l_0_1, "\\setup.exe") or StringEndsWith(l_0_1, "\\open.exe") then
  return mp.INFECTED
end
return mp.CLEAN

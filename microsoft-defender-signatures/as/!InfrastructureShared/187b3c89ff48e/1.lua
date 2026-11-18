-- Threat: !InfrastructureShared
-- Name: 187b3c89ff48e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not StringEndsWith(l_0_1, "\\w3wp.exe") then
  return mp.CLEAN
end
return mp.INFECTED

-- Threat: !InfrastructureShared
-- Name: ebb3c4b0c863
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not StringEndsWith(l_0_1, "\\w3wp.exe") then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine("BM")
return mp.INFECTED

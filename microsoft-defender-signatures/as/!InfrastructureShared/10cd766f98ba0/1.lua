-- Threat: !InfrastructureShared
-- Name: 10cd766f98ba0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not contains(l_0_1, "node.exe") then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
local l_0_3 = l_0_2:match("node%.exe\"?%s+\"?([^\"]+%.cfg)\"?")
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN

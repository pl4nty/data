-- Threat: !InfrastructureShared
-- Name: 3bd7808022a2
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {"-r ", ".js"}
if not containsall(string.lower(l_0_1), l_0_2) then
  return mp.CLEAN
end
local l_0_3 = sysio.GetPEVersionInfo(l_0_0.image_path)
if isnull(l_0_3) or isnull(l_0_3.OriginalFilename) then
  return mp.CLEAN
end
local l_0_4 = {
  ["node.exe"] = true
}
if not l_0_4[string.lower(l_0_3.OriginalFilename)] then
  return mp.CLEAN
end
return mp.INFECTED

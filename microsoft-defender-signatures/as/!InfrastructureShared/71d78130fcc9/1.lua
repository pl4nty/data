-- Threat: !InfrastructureShared
-- Name: 71d78130fcc9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
local l_0_2 = {"http"}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 == nil and l_0_3.image_path == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3.image_path)
local l_0_5 = l_0_4:match("([^\\]+)$")
local l_0_6 = {
  ["explorer.exe"] = true,
  ["powershell.exe"] = true,
  ["mshta.exe"] = true
}
if l_0_6[l_0_5] then
  return mp.INFECTED
end
return mp.CLEAN

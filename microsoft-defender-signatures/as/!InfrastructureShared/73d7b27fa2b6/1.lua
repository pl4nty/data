-- Threat: !InfrastructureShared
-- Name: 73d7b27fa2b6
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$"):match("^[^ ]+") ~= "cmd.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_0.ppid):lower()
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = l_0_2:match("copy%s+([^%s]+%.[^%s]+)")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_2 = l_0_2:gsub("%s+", "")
local l_0_4 = "copy" .. l_0_3 .. l_0_3 .. ".bat&" .. l_0_3 .. ".bat"
if l_0_2:find(l_0_4, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

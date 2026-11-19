-- Threat: !InfrastructureShared
-- Name: 239d7e1b2fd4b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
if #l_0_3 < 50 then
  return mp.CLEAN
end
if 400 < #l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = string.gsub(l_0_3, "[\"'`^()+#&]", "")
local l_0_5 = {
  "iwr",
  "iex",
  "irm",
  "curl",
  "bitsadmin",
  "e:jscript",
  "downloadstring",
  "invoke-restmethod",
  "invoke-webrequest",
  "invoke-expression",
  "start-process",
  "c:\\users\\public\\"
}
if contains(l_0_4, l_0_5) then
  return mp.INFECTED
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: c7b311587cb1
-- Type: 21
-- Includes: TechniqueTracker, Path, LuaFuncHelper

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  l_0_0 = l_0_0 and normalize_path(l_0_0)
end
if l_0_0 == nil or #l_0_0 <= 8 then
  return mp.CLEAN
end

local function l_0_1(l_1_0)
  local l_1_1 = string.lower(l_1_0 or "")
  local l_1_2 = {
    ".exe",
    ".dll",
    ".scr",
    ".cpl",
    ".com",
    ".bat",
    ".cmd",
    ".ps1",
    ".vbs",
    ".vbe",
    ".js",
    ".jse",
    ".wsf",
    ".wsh",
    ".hta"
  }
  for l_1_3, l_1_4 in ipairs(l_1_2) do
    if StringEndsWith(l_1_1, l_1_4) then
      return true
    end
  end
  return false
end

if not l_0_1(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = mp.IsKnownFriendlyFile(l_0_0, false, false)
if l_0_2 == true then
  return mp.CLEAN
end
AppendToRollingQueue(l_0_0, "software_deployment_tools_dropped_file", 1, 900)
AppendToRollingQueue(l_0_0, "BM:MsIntuneDeployment.A", 1, 900)
return mp.INFECTED

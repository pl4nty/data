-- Threat: !InfrastructureShared
-- Name: e5d7abcc0c31
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = 0
l_0_2 = str_count_match(l_0_1, {
  "powershell",
  "curl",
  "mshta",
  "http",
  "iex",
  "taskkill"
})
if 2 <= l_0_2 then
  local l_0_3 = mp.GetParentProcInfo()
  if l_0_3 ~= nil then
    local l_0_4 = string.lower(l_0_3.image_path)
    if string.find(l_0_4, "\\explorer.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

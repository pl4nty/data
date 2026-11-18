-- Threat: !InfrastructureShared
-- Name: bbd7c3a0dae3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = {"http"}
if not contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = mp.GetParentProcInfo()
if l_0_4 ~= nil and l_0_4.image_path ~= nil then
  local l_0_5 = string.lower(l_0_4.image_path)
  local l_0_6 = l_0_5:match("([^\\]+)$")
  local l_0_7 = {
    ["explorer.exe"] = true
  }
  if l_0_7[l_0_6] then
    return mp.INFECTED
  end
end
return mp.LOWFI

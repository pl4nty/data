-- Threat: !InfrastructureShared
-- Name: 89d7cb8268f3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil then
  local l_0_3 = string.lower(l_0_2.image_path)
  local l_0_4 = mp.GetProcessCommandLine(l_0_2.ppid)
  local l_0_5 = {"python.exe"}
  local l_0_6 = {"bootstrap5"}
  if contains(l_0_3, l_0_5) then
    return mp.CLEAN
  end
  if contains(l_0_4, l_0_6) then
    return mp.CLEAN
  end
end
local l_0_7 = {
  "(?:set|add)-mppreference\\s+-exclusionpath\\s+c:\\\\\\s*$",
  "(?:set|add)-mppreference\\s+-exclusionpath\\s+['\"]c:\\\\['\"]\\s*$",
  "(?:set|add)-mppreference\\s+-exclusionpath\\s+c:\\\\\\s*[,;]['\"]?\\s*\\w?"
}
local l_0_8 = false
for l_0_9, l_0_10 in ipairs(l_0_7) do
  l_0_8, l_0_9 = MpCommon.StringRegExpSearch(l_0_10, l_0_1)
  if l_0_8 then
    if versioning.IsSeville() then
      return mp.INFECTED
    else
      return mp.LOWFI
    end
  end
end
return mp.CLEAN

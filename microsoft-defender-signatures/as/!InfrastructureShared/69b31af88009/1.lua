-- Threat: !InfrastructureShared
-- Name: 69b31af88009
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = this_sigattrlog[2]
else
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
for l_0_2, l_0_3 in ipairs(l_0_1) do
  l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
  local l_0_4 = string.lower(string.sub(l_0_3, -14))
  if l_0_4 == "\\litetouch.wsf" then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, true, false) then
    bm.add_related_file(l_0_3)
  end
end
local l_0_5
if this_sigattrlog[3].matched then
  l_0_5 = mp.GetExecutablesFromCommandLine(this_sigattrlog[3].utf8p2)
end
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = false
for l_0_7, l_0_8 in ipairs(l_0_5) do
  l_0_8 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_8))
  if not string.find(l_0_8, "\\windows\\system32\\", 1, true) and (string.find(l_0_8, "\\appdata\\", 1, true) or string.find(l_0_8, "\\temp\\", 1, true) or string.find(l_0_8, "\\public\\", 1, true)) and sysio.IsFileExists(l_0_8) and not mp.IsKnownFriendlyFile(l_0_8, true, false) then
    l_0_6 = true
    bm.add_related_file(l_0_8)
  end
end
if l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN

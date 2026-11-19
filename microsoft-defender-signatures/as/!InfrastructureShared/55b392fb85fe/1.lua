-- Threat: !InfrastructureShared
-- Name: 55b392fb85fe
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2))
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p2))
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(string.lower(this_sigattrlog[1].utf8p1))
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_0, "(.-)[^\\]-[^\\%.]+$")
local l_0_3 = string.match(l_0_1, "(.-)[^\\]-[^\\%.]+$")
if l_0_2 == nil or #l_0_2 == 0 or l_0_3 == nil or #l_0_3 == 0 then
  return mp.CLEAN
end
if l_0_2 ~= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = {
  "\\windows\\system32\\",
  "\\windows\\syswow64\\"
}
for l_0_5, l_0_6 in pairs(l_0_4) do
  if #l_0_2 > #l_0_6 and string.sub(l_0_2, -#l_0_6) == l_0_6 then
    return mp.CLEAN
  end
end
bm.add_related_file(l_0_0)
local l_0_7 = {
  "%windir%\\system32\\",
  "%windir%\\syswow64\\"
}
local l_0_8 = string.match(l_0_0, "([^\\]+)$")
if l_0_8 == nil then
  return mp.CLEAN
end
for l_0_9, l_0_10 in pairs(l_0_7) do
  local l_0_11 = mp.ContextualExpandEnvironmentVariables(l_0_10 .. l_0_8)
  if l_0_11 ~= nil and sysio.IsFileExists(l_0_11) then
    return mp.INFECTED
  end
end
return mp.CLEAN

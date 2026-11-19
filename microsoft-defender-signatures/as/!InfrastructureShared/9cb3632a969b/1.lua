-- Threat: !InfrastructureShared
-- Name: 9cb3632a969b
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  if string.len(l_0_0) < 100 then
    return mp.CLEAN
  end
  if string.find(l_0_0, "%.ps1") then
    return mp.CLEAN
  end
  if not string.find(l_0_0, "{%d%d?}{%d%d?}") then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(string.gsub(l_0_0, "`", ""))
  local l_0_2 = string.gsub(l_0_1, " ", "")
  if string.find(l_0_2, "/admin/", 1, true) and string.find(l_0_2, "get.", 1, true) and string.find(l_0_2, "php", 1, true) and string.find(l_0_2, "invoke", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

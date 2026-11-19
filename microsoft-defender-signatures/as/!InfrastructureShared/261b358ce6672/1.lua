-- Threat: !InfrastructureShared
-- Name: 261b358ce6672
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p2)
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {
  " /etc/sudoers",
  " /etc/shadow",
  " /etc/passwd",
  " /etc/ld.so.preload"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_0:sub(-1 * #l_0_3) == l_0_3 then
    reportRelatedBmHits()
    addRelatedProcess()
    return mp.INFECTED
  end
end
local l_0_4 = {
  " /etc/sudoers ",
  " /etc/shadow ",
  " /etc/passwd ",
  " /etc/ld.so.preload "
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_0, l_0_6, 1, true) then
    reportRelatedBmHits()
    addRelatedProcess()
    return mp.INFECTED
  end
end
return mp.CLEAN

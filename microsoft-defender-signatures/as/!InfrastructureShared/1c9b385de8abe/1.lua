-- Threat: !InfrastructureShared
-- Name: 1c9b385de8abe
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if contains(l_0_1, {
  "node_modules",
  ".openclaw/skills/"
}) then
  return mp.CLEAN
end
local l_0_2 = {
  ".sh",
  ".py",
  ".pl",
  ".rb",
  ".elf",
  ".so",
  ".plist",
  ".service"
}
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if l_0_1:sub(-#l_0_5) == l_0_5 then
    l_0_3 = true
    break
  end
end
l_0_3 = l_0_3 or contains(l_0_1, {
  "/etc/cron",
  "/library/launchagents/",
  "/library/launchdaemons/"
})
if not l_0_3 then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl")
add_parents()
return mp.INFECTED

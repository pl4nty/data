-- Threat: !InfrastructureShared
-- Name: 32b3b78e5826
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = {}
for l_0_2 in string.gmatch(l_0_0, "[^%s]+") do
  table.insert(l_0_1, l_0_2)
end
local l_0_3 = {
  "/var/tmp/",
  "/tmp/.",
  "/dev/shm/",
  "/root/",
  "/home/",
  "/run/",
  "/var/run/"
}
local l_0_4 = {}
if next(l_0_1) ~= nil then
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if l_0_1[#l_0_1]:sub(1, #l_0_6) == l_0_6 and sysio.IsFileExists(l_0_1[#l_0_1]) then
      for l_0_7 in string.gmatch(l_0_1[#l_0_1], "([^/]+)") do
        table.insert(l_0_4, l_0_7)
      end
    end
  end
end
if next(l_0_4) ~= nil and string.find(l_0_4[#l_0_4], "cron", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

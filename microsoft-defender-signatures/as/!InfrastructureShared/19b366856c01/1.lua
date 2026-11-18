-- Threat: !InfrastructureShared
-- Name: 19b366856c01
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
local l_0_1, l_0_2, l_0_3 = l_0_0:find("DestIp=(.-;)")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {
  "127.0.0.1",
  "204.174.66.",
  "205.178.189.",
  "207.6.98.",
  "208.91.197.",
  "208.94.117.",
  "209.53.113."
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_3, l_0_6, 1, false) ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED

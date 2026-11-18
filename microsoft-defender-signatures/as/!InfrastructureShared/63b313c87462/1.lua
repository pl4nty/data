-- Threat: !InfrastructureShared
-- Name: 63b313c87462
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end

local function l_0_1(l_1_0)
  local l_1_1 = {}
  for l_1_2 in string.gmatch(l_1_0, "http[s]?://[^\"%s]+") do
    table.insert(l_1_1, l_1_2)
  end
  return l_1_1
end

if l_0_0 ~= nil then
  local l_0_2 = l_0_1(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if string.match(l_0_4, "^https?://") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

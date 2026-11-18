-- Threat: !InfrastructureShared
-- Name: 2c2b39f82c552
-- Type: 21

local l_0_0
local l_0_1 = false
local l_0_2 = false
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_1 = true
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
  l_0_2 = true
end

function findVersionfromPath(l_1_0, l_1_1)
  local l_1_2 = string.match(l_1_0, l_1_1 .. "%-(.-).jar")
  local l_1_3, l_1_4 = l_1_2:gsub("%D+", "")
  return l_1_3
end

if l_0_0 ~= nil then
  if l_0_1 == true then
    local l_0_3 = findVersionfromPath(l_0_0, "webmvc")
    l_0_3 = tonumber(l_0_3)
    if l_0_3 < 5318 and 5300 < l_0_3 then
      return mp.INFECTED
    end
  end
  if l_0_2 == true then
    local l_0_4 = findVersionfromPath(l_0_0, "webflux")
    l_0_4 = tonumber(l_0_4)
    if l_0_4 < 5219 and 5200 < l_0_4 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

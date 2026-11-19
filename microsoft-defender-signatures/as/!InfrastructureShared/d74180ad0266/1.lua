-- Threat: !InfrastructureShared
-- Name: d74180ad0266
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end

local function l_0_2(l_1_0)
  return l_1_0:gsub("%%(%x%x)", function(l_2_0)
    return string.char(tonumber(l_2_0, 16))
  end)
end

local function l_0_3(l_3_0)
  if type(l_3_0) ~= "string" then
    return false
  end
  local l_3_1 = l_3_0:match("https?://[^/]+(/.+)")
  if not l_3_1 then
    return false
  end
  local l_3_2 = l_0_2(l_3_1)
  local l_3_3 = string.char(27)
  local l_3_4 = string.char(7)
  local l_3_5 = l_3_3 .. "%]0;.-" .. l_3_4
  return l_3_2:find(l_3_5, 1, false) ~= nil
end

local l_0_4 = l_0_2(l_0_1)
if l_0_3(l_0_4) then
  return mp.INFECTED
end
return mp.CLEAN

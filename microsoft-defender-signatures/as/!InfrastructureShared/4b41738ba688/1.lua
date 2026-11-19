-- Threat: !InfrastructureShared
-- Name: 4b41738ba688
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
local l_0_1 = nri.GetRawResponseBlob()
if type(l_0_0) ~= "string" or type(l_0_1) ~= "string" then
  return mp.CLEAN
end
local l_0_2 = l_0_0:byte(1)
if l_0_2 == 4 then
  if #l_0_0 < 9 or #l_0_1 < 8 or l_0_0:byte(2) ~= 1 and l_0_0:byte(2) ~= 2 or l_0_1:byte(1) ~= 0 or l_0_1:byte(2) < 90 or l_0_1:byte(2) > 93 then
    return mp.CLEAN
  end
  local l_0_3 = l_0_0:sub(1, 4096)
  local l_0_4 = l_0_3:find("\000", 9, true)
  if not l_0_4 then
    return mp.CLEAN
  end
  if l_0_0:byte(5) == 0 and l_0_0:byte(6) == 0 and l_0_0:byte(7) == 0 and l_0_0:byte(8) ~= 0 then
    local l_0_5 = l_0_3:find("\000", l_0_4 + 1, true)
    if not l_0_5 or l_0_5 == l_0_4 + 1 then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
if l_0_2 ~= 5 or #l_0_0 < 3 or #l_0_1 < 2 or l_0_1:byte(1) ~= 5 then
  return mp.CLEAN
end
local l_0_6 = l_0_0:byte(2)
local l_0_7 = l_0_1:byte(2)
if l_0_6 == 0 or #l_0_0 < 2 + l_0_6 or l_0_7 == 255 then
  return mp.CLEAN
end
local l_0_8 = false
for l_0_9 = 3, 2 + l_0_6 do
  if l_0_0:byte(l_0_9) == 255 then
    return mp.CLEAN
  end
  if l_0_0:byte(l_0_9) == l_0_7 then
    l_0_8 = true
  end
end
if l_0_8 then
  return mp.INFECTED
end
return mp.CLEAN

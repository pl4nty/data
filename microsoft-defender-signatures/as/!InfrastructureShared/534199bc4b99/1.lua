-- Threat: !InfrastructureShared
-- Name: 534199bc4b99
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0:match("\r\n\r\n(.*)")
if not l_0_1 or #l_0_1 == 0 then
  l_0_1 = l_0_0
end
local l_0_2 = l_0_1:match("__VIEWSTATE=([^&]+)")
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = l_0_2:gsub("%%2[Bb]", "+")
l_0_2 = l_0_2:gsub("%%2[Ff]", "/")
l_0_2 = l_0_2:gsub("%%3[Dd]", "=")
l_0_2 = l_0_2:gsub(" ", "+")
local l_0_3 = 1200
if l_0_3 > #l_0_2 then
  return mp.CLEAN
end
local l_0_4 = l_0_2:gsub("%s+", "")
if not l_0_4:match("^[A-Za-z0-9%+/%=]+$") then
  return mp.CLEAN
end
if #l_0_4 % 4 ~= 0 then
  return mp.CLEAN
end
if l_0_4:match("=.+") then
  return mp.CLEAN
end
return mp.INFECTED

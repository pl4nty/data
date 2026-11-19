-- Threat: !InfrastructureShared
-- Name: 2540f71a2a1c
-- Type: 21

if nri.IsResponse() then
  return mp.CLEAN
end
local l_0_0 = nri.GetURI()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2, l_0_3 = l_0_0:match("^([%a][%w+%.%-]*)://([^/?#]+)([^?#]*)")
if l_0_1 == nil or l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 ~= "http" and l_0_1 ~= "https" then
  return mp.CLEAN
end
if string.find(l_0_2, "@", 1, true) then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if not l_0_3:match("%.php$") and not l_0_3:match("%.phtml$") and not l_0_3:match("%.php5$") and not l_0_3:match("%.php7$") and not l_0_3:match("%.phar$") and not l_0_3:match("%.inc$") then
  return mp.CLEAN
end
local l_0_4 = l_0_0:match("%?([^#]*)")
if l_0_4 == nil then
  return mp.CLEAN
end
if not string.find("&" .. l_0_4, "&k=[^&]+") then
  return mp.CLEAN
end
return mp.INFECTED

-- Threat: !InfrastructureShared
-- Name: 35b3a13a42f4
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2, l_0_3, l_0_4
for l_0_5, l_0_6 in ipairs(l_0_0) do
  l_0_2 = string.lower(l_0_6.image_path)
  l_0_3, l_0_4 = string.find(l_0_2, "/postgres", 1, true)
  if l_0_3 ~= nil and l_0_4 ~= nil then
    return mp.INFECTED
  end
  l_0_3, l_0_4 = string.find(l_0_2, "/httpd", 1, true)
  if l_0_3 ~= nil and l_0_4 ~= nil then
    return mp.INFECTED
  end
  l_0_3, l_0_4 = string.find(l_0_2, "/nginx", 1, true)
  if l_0_3 ~= nil and l_0_4 ~= nil then
    return mp.INFECTED
  end
  l_0_3, l_0_4 = string.find(l_0_2, "/php-fpm7", 1, true)
  if l_0_3 ~= nil and l_0_4 ~= nil then
    return mp.INFECTED
  end
  l_0_3, l_0_4 = string.find(l_0_2, "/mysqld", 1, true)
  if l_0_3 ~= nil and l_0_4 ~= nil then
    return mp.INFECTED
  end
  l_0_3, l_0_4 = string.find(l_0_2, "/dnsmasq", 1, true)
  if l_0_3 ~= nil and l_0_4 ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN

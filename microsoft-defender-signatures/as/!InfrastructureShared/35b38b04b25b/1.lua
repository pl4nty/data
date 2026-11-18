-- Threat: !InfrastructureShared
-- Name: 35b38b04b25b
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1, l_0_2
l_0_1, l_0_2 = string.find(l_0_0, "/google-chrome", 1, true)
if l_0_1 ~= nil and l_0_2 ~= nil then
  return mp.INFECTED
end
l_0_1, l_0_2 = string.find(l_0_0, "/chromium-browser", 1, true)
if l_0_1 ~= nil and l_0_2 ~= nil then
  return mp.INFECTED
end
l_0_1, l_0_2 = string.find(l_0_0, "/soffice", 1, true)
if l_0_1 ~= nil and l_0_2 ~= nil then
  return mp.INFECTED
end
l_0_1, l_0_2 = string.find(l_0_0, "/firefox", 1, true)
if l_0_1 ~= nil and l_0_2 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

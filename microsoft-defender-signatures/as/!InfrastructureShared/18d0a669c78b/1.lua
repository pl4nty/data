-- Threat: !InfrastructureShared
-- Name: 18d0a669c78b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 19000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = "\r\ncop%\144\000"
local l_0_2 = mp.BMSearchFile(0, l_0_0, l_0_1)
if l_0_2 == -1 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(l_0_2, 20)
mp.readprotection(true)
if l_0_3 == nil or #l_0_3 == 0 or #l_0_3 ~= 20 then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_3, "cop%%(.-)%% /b")
if l_0_4 == nil or #l_0_4 == 0 then
  return mp.CLEAN
end
if l_0_4 and l_0_4:match("^%a+$") then
  return mp.INFECTED
end
return mp.CLEAN

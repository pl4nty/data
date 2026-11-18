-- Threat: !InfrastructureShared
-- Name: 17d035149339
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 2000000 then
  return mp.CLEAN
end
local l_0_1 = 768
mp.readprotection(false)
local l_0_2 = mp.readfile(l_0_0 - l_0_1, l_0_1)
mp.readprotection(true)
local l_0_3 = l_0_1 + 1 - 4
if string.sub(l_0_2, l_0_3, l_0_3 + 3) ~= "\222\173\190\239" then
  return mp.CLEAN
end
local l_0_4 = l_0_3 - 12
local l_0_5 = mp.readu_u32(l_0_2, l_0_4)
if l_0_5 < 32 or 512 < l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_4 - 4 - 16 - l_0_5
if mp.readu_u32(l_0_2, l_0_6) ~= 64 then
  return mp.CLEAN
end
local l_0_7 = string.sub(l_0_2, l_0_4 - l_0_5, l_0_4 - 1)
local l_0_8 = crypto.ComputeEntropy(l_0_7)
if l_0_8 < 7 then
  return mp.CLEAN
end
local l_0_9 = string.sub(l_0_2, l_0_3 - 8, l_0_3 - 1)
local l_0_10 = l_0_9:gsub(".", function(l_1_0)
  return string.format("%02x", l_1_0:byte())
end)
local l_0_11 = crypto.Sha256Buffer(l_0_7, 0, #l_0_7)
if string.sub(l_0_11, 1, 16) ~= l_0_10 then
  return mp.CLEAN
end
return mp.INFECTED

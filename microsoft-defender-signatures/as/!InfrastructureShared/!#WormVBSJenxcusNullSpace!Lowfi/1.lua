-- Threat: !InfrastructureShared
-- Name: !#Worm:VBS/Jenxcus.NullSpace!Lowfi
-- Type: 13
-- MpAttributes: SCPT:VBS/JenxcusNullSpace

local l_0_0 = mp.getfilesize()
if l_0_0 < 30000000 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, [[

.
.
.
.
.
.
.
.
.
]])
for l_0_5 = 1, 100 do
  l_0_5, l_0_3, l_0_5 = string.find(l_0_1, [[

.
.
.
.
.
.
.
.
.
]], l_0_3)
end
mp.readprotection(false)
local l_0_6 = mp.readfile(l_0_0 / 10, 50000)
if l_0_6 == nil then
  return mp.CLEAN
end
l_0_3 = 1
for l_0_7 = 1, 1000 do
  l_0_7, l_0_3, l_0_7 = string.find(l_0_6, [[

.
.
.
.
.
.
.
.
.
]], l_0_3)
end
if 10000 < l_0_3 then
  return mp.LOWFI
end
return mp.CLEAN

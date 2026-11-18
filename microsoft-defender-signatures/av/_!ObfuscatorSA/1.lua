-- Threat: \xcd!Obfuscator.SA
-- Type: 13
-- MpAttributes: SCRIPT:Worm:VBS/JenxcusCrypt3.1

local l_0_0 = mp.getfilesize()
if l_0_0 < 80000 or 700000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
l_0_1 = string.lower(l_0_1)
local l_0_2, l_0_3 = l_0_1:match("%s=%s\"%d%d%d?(...-)%d%d%d?(...-)%d%d%d?")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_2 ~= l_0_3 then
  return mp.CLEAN
end
return mp.SUSPICIOUS

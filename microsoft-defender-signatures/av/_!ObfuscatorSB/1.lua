-- Threat: \xcd!Obfuscator.SB
-- Type: 13
-- MpAttributes: SCRIPT:Worm:VBS/JenxcusCrypt4.1

if not mp.get_mpattribute("SCPT:Worm:VBS/Jenxcus!Crypt32") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 or 700000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, 8192)
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("public%sfunction%s(%l%l%l%l-)%(")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_1:match("\r\n?\t(%l%l%l%l-)%s=%s\"%x%x%x%x%x%x%x%x%x%x-") or l_0_1:match("\r\n?\t(%l%l%l%l-)%s=%s-chrw%(%d%d%d?%)%s&%schrw%(%d%d%d?%)")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = l_0_0 - 8192
local l_0_5 = l_0_0 - l_0_4
local l_0_6 = mp.readfile(l_0_4, l_0_5)
l_0_6 = string.lower(l_0_6)
local l_0_7, l_0_8 = l_0_6:match("execute%s-%((%l%l%l%l-)%s-%(%s-[^%l]-%l-[^%l]-%(%d%d%d?%)%s-,(%l%l%l%l-)%)%)")
if l_0_7 == nil then
  return mp.CLEAN
end
if l_0_8 == nil then
  return mp.CLEAN
end
if l_0_2 ~= l_0_7 then
  return mp.CLEAN
end
if l_0_3 ~= l_0_8 then
  return mp.CLEAN
end
return mp.SUSPICIOUS

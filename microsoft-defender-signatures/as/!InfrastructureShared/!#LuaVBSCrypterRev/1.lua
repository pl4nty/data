-- Threat: !InfrastructureShared
-- Name: !#Lua:VBS/CrypterRev
-- Type: 13
-- MpAttributes: PossibleJenxcusObfuscator & TARG:VBSWithExecute

local l_0_0 = mp.getfilesize()
if l_0_0 < 20000 then
  return mp.CLEAN
end
if 300000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0 - 8192
local l_0_2 = l_0_0 - (l_0_0 - 8192)
mp.readprotection(false)
local l_0_3 = mp.readfile(l_0_1, l_0_2)
l_0_3 = string.lower(l_0_3)
local l_0_4, l_0_5 = l_0_3:match("(%l-)%s-=%s-decode%(strreverse%((%l-)%)")
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_5 == nil then
  return mp.CLEAN
end
if l_0_4 ~= l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_3:match("(%l-)%s-=%s-.-%(0%)")
if l_0_6 == nil then
  return mp.CLEAN
end
if l_0_6 ~= l_0_5 then
  return mp.CLEAN
end
return mp.INFECTED

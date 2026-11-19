-- Threat: !InfrastructureShared
-- Name: !#Lua:EncryptedZip
-- Type: 13

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 5) ~= 20 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 7) ~= 9 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u32(headerpage, 19)
if l_0_0 < 24576 or 131072 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u16(headerpage, 27)
local l_0_2 = mp.readu_u16(headerpage, 29)
if 128 < l_0_1 then
  return mp.CLEAN
end
local l_0_3 = string.lower(string.char(headerpage[31], headerpage[32], headerpage[33], headerpage[34], headerpage[35]))
if 8 < l_0_1 and l_0_3 == "senha" then
  mp.set_mpattribute("Lua:PossibleFourthremZIP")
end
if not mp.get_mpattribute("RPF:AnyFileHasIOAVURL") then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
if l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_4 = string.lower(string.char(headerpage[31 + l_0_1 - 4], headerpage[31 + l_0_1 - 3], headerpage[31 + l_0_1 - 2], headerpage[31 + l_0_1 - 1]))
if l_0_4 ~= ".exe" and l_0_4 ~= ".pif" and l_0_4 ~= ".scr" then
  return mp.CLEAN
end
local l_0_5 = 30 + l_0_1 + l_0_2 + l_0_0
local l_0_6 = mp.getfilesize()
if l_0_6 < l_0_5 + 16 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = mp.readfile(l_0_5, 4)
if l_0_7 ~= "PK\003\004" then
  mp.set_mpattribute("Lua:IOAVZIPSingleEncryptedEXE")
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: !#TEL:LUA:Trojan:Win64/Winnti.S!dha
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 < 103000 or 113000 < l_0_0 then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 10 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 0 or mp.readu_u32(headerpage, 5) ~= 0 or mp.readu_u16(headerpage, 9) ~= 0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0 - 8000, 4000)
if string.find(l_0_1, "IsInfectedRun\000IsPassKavSucess\000IsPassSucess1\000IsPassSucess2\000IsRuninUAC", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

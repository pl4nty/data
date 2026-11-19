-- Threat: !InfrastructureShared
-- Name: !#TELPER:LUA:Shellcode:Egghunt.B!dha
-- Type: 13
-- MpAttributes: SCRIPT:OlefileCheck

local l_0_0 = mp.getfilesize()
if l_0_0 < 500000 then
  return mp.CLEAN
end
if 700000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if nil ~= string.find(l_0_1, "->word/activex/activex") then
  mp.readprotection(false)
  local l_0_2 = mp.readfile(1024, 256)
  if string.match(l_0_2, "\176\014\229\234bJ\206\017\190\214\000\170\000a\016\128") ~= nil then
    local l_0_3 = mp.readfile(2000, 1000)
    local l_0_4 = string.match(l_0_3, "U\139\236\129\236%X%X%z%z\199E\252%X%X%z%z\198E")
    if l_0_4 ~= nil and l_0_4:len() == 18 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

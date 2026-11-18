-- Threat: !InfrastructureShared
-- Name: !#TELPER:LUA:Shellcode:Egghunt.A!dha
-- Type: 13
-- MpAttributes: SCRIPT:OlefileCheck

local l_0_0 = mp.getfilesize()
if l_0_0 < 500000 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if nil ~= string.find(l_0_1, "->word/activex/activex") then
  mp.readprotection(false)
  local l_0_2 = mp.readfile(65536, 3000)
  if string.find(l_0_2, "j&X1\201\137\226d\255\019YZ", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN

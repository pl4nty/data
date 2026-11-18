-- Threat: !InfrastructureShared
-- Name: !#LUA:JS/GootKitz.D
-- Type: 13
-- MpAttributes: (SCRIPT:JS/GootKitz.G & SCRIPT:JS/GootKitz.H) | (TrojanDownloader:VBS/GootKitsd2 & TrojanDownloader:VBS/GootKitsd5 & SCRIPT:JS/GootKitz.H)

local l_0_0 = mp.getfilesize()
if 4096 < l_0_0 and l_0_0 < 716800 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(300000, 400000))
mp.readprotection(true)
local l_0_2, l_0_3 = MpCommon.StringRegExpSearch("[a-zA-Z]='[a-z?].*?\\+\\\\", string.lower(l_0_1))
if l_0_2 == true then
  return mp.INFECTED
end
return mp.CLEAN

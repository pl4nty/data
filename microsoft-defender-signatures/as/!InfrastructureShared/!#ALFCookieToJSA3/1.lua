-- Threat: !InfrastructureShared
-- Name: !#ALF:CookieToJS.A3
-- Type: 13
-- MpAttributes: BM_ScriptFile & (ALF:Cookie.Stom.1 | ALF:Kitbot.Stom.1 | ALF:Phishing.Stm.1)

local l_0_0 = mp.getfilesize()
if l_0_0 < 8192 or 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(1000, l_0_0 - 1001)
mp.readprotection(true)
if string.find(l_0_1, "console.log('cookies Set', key, value, '!IMPORTANT __Host- prefix: Cookies with names starting with __Host-", 1, true) ~= nil or string.find(l_0_1, "console.log('cookies Set', key, value, '!IMPORTANT __Secure- prefix: Cookies with names starting with __Secure-", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

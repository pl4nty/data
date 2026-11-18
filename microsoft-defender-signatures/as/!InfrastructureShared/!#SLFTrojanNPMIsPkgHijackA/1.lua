-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:NPM/IsPkgHijack.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & SCPT:NpmY_IsPkg_ReturnRequire

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(tostring(l_0_1))
local l_0_2, l_0_3 = string.gsub(l_0_1, "\\u200c", "")
if l_0_3 < 100 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = string.gsub(l_0_1, "switch", "")
if l_0_5 < 50 then
  return mp.CLEAN
end
local l_0_6, l_0_7 = string.gsub(l_0_1, "%.push", "")
if l_0_7 < 50 then
  return mp.CLEAN
end
local l_0_8, l_0_9 = string.gsub(l_0_1, "0x%x%x", "")
if l_0_9 < 500 then
  return mp.CLEAN
end
return mp.INFECTED

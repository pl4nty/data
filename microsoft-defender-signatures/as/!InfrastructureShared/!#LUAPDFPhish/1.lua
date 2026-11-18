-- Threat: !InfrastructureShared
-- Name: !#LUA:PDFPhish
-- Type: 13
-- MpAttributes: BM_PDF_FILE & SCPT:PDF/Phish.RA1 & SCPT:PDF/Phish.RA2 & SCPT:PDF/Phish.RA3

mp.readprotection(false)
local l_0_0 = tostring(mp.readfile(8192, 8192))
if string.find(l_0_0, "https://ttraff.ru/", 1, true) ~= nil or string.find(l_0_0, "https://ttraff.com/", 1, true) ~= nil or string.find(l_0_0, "https://ttraff.me/", 1, true) ~= nil or string.find(l_0_0, "https://ttraff.cc/", 1, true) ~= nil or string.find(l_0_0, "https://ttraff.club/", 1, true) ~= nil or string.find(l_0_0, "https://ttraff.link/", 1, true) ~= nil or string.find(l_0_0, "https://cctraff.ru/", 1, true) ~= nil or string.find(l_0_0, "https://ggtraff.ru/", 1, true) ~= nil or string.find(l_0_0, "https://gettraff.ru/", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

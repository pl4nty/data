-- Threat: !InfrastructureShared
-- Name: 2eb3341efe49
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1:lower()
end
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
if not contains(l_0_0, {
  "winrar.exe",
  "7zip.exe",
  "peazip.exe",
  "unrar.exe",
  "7z.exe",
  "360zip.exe",
  "7zfm.exe",
  "bandizip.exe",
  "rar.exe",
  "unrar.exe",
  "haozip.exe",
  "breezip.exe",
  "netpowerzip.exe",
  "xdzipapp.exe"
}) then
  return mp.INFECTED
end
return mp.CLEAN

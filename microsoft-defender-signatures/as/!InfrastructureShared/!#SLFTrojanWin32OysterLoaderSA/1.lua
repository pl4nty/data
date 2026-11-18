-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/OysterLoader.SA
-- Type: 24
-- Includes: BMLuaLib
-- MpAttributes: LUA:FileSizeLE20000.A & Lua:NoVerinfo

local l_0_0 = mp.getfilename()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "msteamssetup.exe",
  "zoominstallerfull.exe",
  "mssetup.exe"
}
if contains(l_0_0, l_0_1) then
  local l_0_2 = mp.GetCertificateInfo()
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if l_0_4.Signers == nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN

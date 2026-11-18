-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/Gracing.C
-- Type: 11
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: (RPF:GoLang:pclntab_magic_unknown & (!pea_amd64_image))

local l_0_0 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  4294967280,
  4294967291,
  4294967290,
  4294967281
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if mp.bitand(l_0_0, l_0_3) ~= l_0_3 then
    local l_0_4 = "Medicated32Golang"
    local l_0_5 = 3600
    local l_0_6 = 15
    AppendToRollingQueue(l_0_4, "magik", 1, l_0_5, l_0_6)
    if mp.IsTrustedFile(false) == true then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN

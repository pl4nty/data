-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/GoGracing.I
-- Type: 11
-- Includes: BMLuaLib
-- MpAttributes: (RPF:GoLang:pclntab_magic_unknown & pea_amd64_image)

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
    local l_0_4, l_0_5 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_FILEPATH)
    if l_0_4 and not isnull(l_0_5) then
      local l_0_6 = MpCommon.PathToWin32Path(l_0_5)
      if isnull(l_0_6) then
        return mp.CLEAN
      end
      l_0_6 = string.lower(l_0_6)
      local l_0_7 = {
        "^%a:\\program files\\",
        "^%a:\\program files %(x86%)\\",
        "^%a:\\programdata\\microsoft\\",
        "^%a:\\windows\\system32\\",
        "^%a:\\windows\\syswow64\\",
        "^%a:\\windows\\winsxs\\"
      }
      local l_0_8 = false
      for l_0_9, l_0_10 in ipairs(l_0_7) do
        if string.find(l_0_6, l_0_10) then
          l_0_8 = true
          break
        end
      end
      if not l_0_8 then
        if mp.IsTrustedFile(false) == true then
          return mp.CLEAN
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN

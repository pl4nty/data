-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/ReplaceMarkerLoader.A!MTB
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SCRIPT:Powershell/SuspReplace.A

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if mp.get_mpattribute("SCRIPT:PowerShell/InvokExpDoll.A!MTB") then
  local r0_0 = mp.getfilesize()
  if r0_0 ~= nil and not (r0_0 <= 0) then
    mp.readprotection(false)
    local r0_1 = tostring(mp.readfile(0, r0_0)) or ""
    mp.readprotection(true)
    if r0_1 == "" then
      return mp.CLEAN
    end
    local r0_2 = string.match(r0_1, "%-replace%s*'([%a][%w_]*)'%s*,%s*''")
      or string.match(r0_1, '%-replace%s*"([%a][%w_]*)"%s*,%s*""')
    if r0_2 == nil then
      return mp.CLEAN
    end
    if not (#r0_2 < 2) and not (#r0_2 > 12) then
      local r0_3, r0_4 = string.gsub(r0_1, r0_2, "")
      if r0_4 < 25 then
        return mp.CLEAN
      end
      local r0_5 = string.lower(string.gsub(r0_1, r0_2, ""))
      if 0
        + str_count_match(r0_5,
          {
            "invoke-expression", "iex", "system.security.cryptography.aes", "createdecryptor",
            "transformfinalblock", "frombase64string", "unicode.getstring",
            "system.io.compression.gzipstream", "compressionmode", "memorystream",
            "reflection.assembly", "entrypoint", "rawui.windowtitle"
          })
        < 5 then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN

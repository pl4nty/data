-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/AmsiBypazz.Z!MTB
-- Type: 13
-- MpAttributes: SCRIPT:PowerShell/IexStrNew.C & MpIsPowerShellAMSIScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_AMSI then
  local r0_0 = mp.getfilesize()
  if r0_0 ~= nil and not (r0_0 > 131072) then
    mp.readprotection(false)
    local r0_1 = tostring(mp.readfile(0, r0_0)) or ""
    mp.readprotection(true)
    local r0_2 = false
    local r0_3, r0_4 = MpCommon.StringRegExpSearch("([iI][eE][xX]|[iI][nN][vV][oO][kK][eE]%-[eE][xX][pP][rR][eE][sS][sS][iI][oO][nN])\\s*\\(\\s*\\[string\\]::new\\s*\\(\\s*\\(\\s*\\d+\\s*,\\s*\\d+\\s*,\\s*\\d+(?:\\s*,\\s*\\d+){20,}\\s*\\)\\s*\\)",
      r0_1)
    _ = r0_4
    if r0_3 == false then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN

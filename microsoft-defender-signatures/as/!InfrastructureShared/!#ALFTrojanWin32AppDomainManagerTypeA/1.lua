-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/AppDomainManagerType.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: !BM_MZ_FILE & SCPT:AppDomainManagerType.A & SCPT:AppDomainManagerType.B & RPF:TopLevelFile

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if r0_0 ~= nil and r0_0 ~= "" then
  if string.sub(r0_0, -11) == ".exe.config" and string.find(r0_0, "program files", 1, true) == nil then
    local r0_1 = mp.getfilesize()
    r0_1 = r0_1 > 10000 and 10000 or r0_1
    mp.readprotection(false)
    local r0_2 = tostring(mp.readfile(0, r0_1))
    mp.readprotection(true)
    local r0_3 = r0_2:match('<appDomainManagerAssembly value="([^"\r\n\\,]+)')
    local r0_4 = r0_2:match('<probing privatePath="([^"\r\n]+)')
    local r0_5 = nil
    if string.sub(r0_3, -4) ~= ".dll" then
      r0_3 = r0_3 .. ".dll"
    end
    if r0_4 and r0_4 ~= "" then
      if string.sub(r0_4, -1) == "\\" then
        r0_5 = r0_4 .. r0_3
      else
        r0_5 = r0_4 .. "\\" .. r0_3
      end
    else
      r0_5 = r0_0:match("^(.*)[/\\][^/\\]+$") .. "\\" .. r0_3
    end
    if sysio.IsFileExists(r0_5) then
      mp.ReportLowfi(r0_5, 1924697406)
      local r0_6 = "SuspiciousAppDomainAssembly"
      mp.set_mpattribute(string.format("%s!%s", r0_6, r0_5))
      local r0_7 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
      if not isnull(r0_7) then
        MpCommon.BmTriggerSig(r0_7, r0_6, string.format("Config=%s;Assembly=%s", r0_0, r0_5))
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN

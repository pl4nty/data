-- Threat: !InfrastructureShared
-- Name: 93d7aec42d05
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.GetParentProcInfo()
if r0_0 and r0_0.ppid and r0_0.image_path then
  local r0_1 = r0_0.image_path
  local r0_2 = r0_1
  r0_1 = r0_2.match
  r0_1 = r0_1(r0_2, "([^\\]+)$") or ""
  if r0_1 then
    local r0_3 = mp.GetScannedPPID()
    if r0_3 == "" or r0_3 == nil then
      return mp.CLEAN
    end
    local r0_4 = mp.GetProcessCommandLine(r0_3)
    if r0_4 then
      r0_4 = string.lower(r0_4)
      if not MpCommon.StringRegExpSearch("(pip|pip3|cargo)(\\.exe)?\\s+(install|add)", r0_4) then
        return mp.CLEAN
      end
      local r0_5 = r0_4:match("install%s+%-%-upgrade%s+(.+)")
      r0_5 = r0_5 or r0_4:match("install%s+(.+)") or r0_4:match("add%s+(.+)")
      r0_5 = r0_5 or ""
      local r0_6 = r0_5.match
      r0_6 = r0_6(r0_5, "==(.*)") or ""
      local r0_7 = MpCommon.BmTriggerSig
      local r0_8 = r0_0.ppid
      local r0_9, r0_10, r0_11 = r0_1, r0_5, r0_6
      r0_9 = r0_9 .. "|" .. r0_10 .. "|" .. r0_11
      r0_10 = nil
      r0_11 = nil
      r0_7(r0_8, "PFApp_PipInstall_A", r0_9)
    end
  end
end
return mp.CLEAN

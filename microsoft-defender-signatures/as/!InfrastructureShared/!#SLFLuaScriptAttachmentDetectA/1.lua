-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:ScriptAttachmentDetect.A
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: CloudBlockLevelGT3 & Lua:TT:DetectionThresholdMet

if mp.get_mpattribute("Lua:FileInOutlookCache.A") or mp.get_mpattribute("Lua:FileInWindowsMailApp.A") then
  local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_1 = {
    vbs = true,
    ps1 = true,
    [".js"] = true,
    jse = true,
    vbe = true
  }
  local l_0_2 = string.sub(l_0_0, -3)
  if l_0_2 ~= nil and l_0_1[l_0_2] == true then
    local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
    if l_0_3 then
      TrackPidAndTechnique(l_0_3, "T1566.001 ", "phishingattachment")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN

-- Threat: !InfrastructureShared
-- Name: !#Lua:ScriptExecutionFromNewVolume.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & MpOnOpenRtpScan & BM_SCRIPT_OR_TEXT_FILE & (Lua:JSExt | Lua:JSEExt | Lua:VBSExt | Lua:VBEExt | Lua:BATExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_1 = {
  ["cmd.exe"] = true,
  ["wscript.exe"] = true,
  ["cscript.exe"] = true,
  ["explorer.exe"] = true
}
if l_0_0 == nil or l_0_1[l_0_0] ~= true then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(MpCommon.RollingQueueCountNamespaced, "NewVolumeMounted", "Volumes")
if not (l_0_3 and l_0_4) or l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueQueryKVNamespaced, "NewVolumeMounted", "Volumes")
if l_0_5 and l_0_6 ~= nil then
  for l_0_7, l_0_8 in pairs(l_0_6) do
    if l_0_2:find(l_0_8, 1, true) ~= nil then
      if l_0_0 == "explorer.exe" then
        mp.set_mpattribute("Lua:ScriptExecutionFromNewVolume.A!MpDisableCachingSet")
        mp.set_mpattribute("MpDisableCaching")
        return mp.CLEAN
      end
      mp.set_mpattribute("Lua:ScriptExecutionFromNewVolume.A")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

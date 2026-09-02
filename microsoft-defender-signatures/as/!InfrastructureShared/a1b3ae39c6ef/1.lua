-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a1b3ae39c6ef\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (mp.ContextualExpandEnvironmentVariables)((this_sigattrlog[1]).utf8p2)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
do
  local l_0_1 = (string.lower)(l_0_0)
  if not (string.find)(l_0_1, "\\appdata\\local\\temp\\", 1, true) ~= nil or (string.find)(l_0_1, "\\appdata\\roaming\\", 1, true) ~= nil or (string.find)(l_0_1, "\\users\\public\\", 1, true) ~= nil or (string.find)(l_0_1, "\\windows\\temp\\", 1, true) ~= nil or (string.find)(l_0_1, "\\programdata\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  ;
  (bm.add_threat_file)(l_0_0)
  ;
  (bm.add_related_string)("TimeProviderRedirect", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1547.003", "persist_timeprovider_redirect")
  do return mp.INFECTED end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end


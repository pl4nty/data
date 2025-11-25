-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ExtractedFromInterestingArchiveA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
l_0_0 = normalize_path(l_0_0)
local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_1 ~= "explorer.exe" then
  return mp.CLEAN
end
do
  if not (mp.get_mpattribute)("BM_MZ_FILE") then
    local l_0_2 = (mp.get_mpattribute)("BM_CONTAINER_FILE")
  end
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = nil
  local l_0_4 = "ArchiveTracker"
  local l_0_5, l_0_6 = , pcall(MpCommon.RollingQueueQueryKVNamespaced, "InterestingZip.A", l_0_4)
  if l_0_6 and MpCommon.RollingQueueQueryKVNamespaced ~= nil then
    for l_0_10,l_0_11 in pairs(R8_PC56) do
      local l_0_7 = nil
      local l_0_13 = l_0_11:match("(.+\\)([^\\]+)$")
      if l_0_0:find(R16_PC65, 1, true) ~= nil then
        (mp.set_mpattribute)("MpDisableCaching")
      end
    end
  end
  do
    return mp.CLEAN
  end
end


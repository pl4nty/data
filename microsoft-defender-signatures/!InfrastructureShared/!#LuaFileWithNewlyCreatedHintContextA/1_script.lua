-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFileWithNewlyCreatedHintContextA\1_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Exception:FileWithNewlyCreatedHintContext") == true then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
;
(MpCommon.AppendPersistContext)(l_0_0, "MpNewlyCreatedHint_5m", 500)
;
(MpCommon.AppendPersistContext)(l_0_0, "MpNewlyCreatedHint_30m", 1800)
;
(MpCommon.AppendPersistContext)(l_0_0, "MpNewlyCreatedHint_2h", 7200)
return mp.CLEAN


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaCreateProcessContextMpNewlyCrea\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Exception:FileWithNewlyCreatedHintContext") == true or (mp.get_mpattribute)("Exception:CreateProcessContext/MpNewlyCreatedHint") == true then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetPersistContextCount)(l_0_0)
if l_0_1 == nil or l_0_1 <= 0 then
  return mp.CLEAN
end
local l_0_2 = false
if (MpCommon.QueryPersistContext)(l_0_0, "MpNewlyCreatedHint_5m") then
  (mp.set_mpattribute)("Lua:CreateProcessContext/MpNewlyCreatedHint_5m")
  l_0_2 = true
end
if (MpCommon.QueryPersistContext)(l_0_0, "MpNewlyCreatedHint_30m") then
  (mp.set_mpattribute)("Lua:CreateProcessContext/MpNewlyCreatedHint_30m")
  l_0_2 = true
end
if (MpCommon.QueryPersistContext)(l_0_0, "MpNewlyCreatedHint_2h") then
  (mp.set_mpattribute)("Lua:CreateProcessContext/MpNewlyCreatedHint_2h")
  l_0_2 = true
end
if l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN


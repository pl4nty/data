-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5ef_376.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if (string.find)(l_0_0, "\\dboconfig", 1, true) ~= nil or (string.find)(l_0_0, "\\provisioning\\", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93b8_342.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 >= 100 and l_0_0 <= 10240 then
  local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_PATH)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  local l_0_2 = "/opt/"
  if l_0_1:sub(1, #l_0_2) == l_0_2 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end


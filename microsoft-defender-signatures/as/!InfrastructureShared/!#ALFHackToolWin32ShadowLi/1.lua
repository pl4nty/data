-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolWin32ShadowLi\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("HEUR:ShadowLink")
do
  if #l_0_0 >= 3 then
    local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_1 ~= nil and l_0_1:find("torrc", 1, true) == nil then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


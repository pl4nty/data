-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaBewoebicBinaryFile\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
do
  if l_0_0 ~= nil and (string.find)(l_0_0, "\\appdata\\roaming\\bbwc\\", 1, true) then
    local l_0_1 = (mp.getfilename)()
    if (string.sub)(l_0_1, -4) ~= ".txt" then
      (mp.set_mpattribute)("Lua:BewoebicBinaryFile.A")
    else
      ;
      (mp.set_mpattribute)("Lua:BewoebicBinaryFile.B")
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end


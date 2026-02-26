-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!#MpIsExhaustiveScriptScan\ObMpAttributes\3.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_0 and #l_0_0 > 0 and (l_0_0:sub(-7)):lower() == ".config" and (mp.BMSearchFile)(0, 32, "# Software Configuration File\144\000") ~= -1 then
  (mp.set_mpattribute)("Lua:SoftEtherConfigScan")
  return mp.INFECTED
end
return mp.CLEAN


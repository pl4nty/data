-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLuaPossible_Offiz_BeaconA\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0:find("->word/_rels/document.xml.rels", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFLuaLargeBATXMLPolyglotA\1.luac 

-- params : ...
-- function num : 0
if (mp.readu_u32)(headerpage, 1) == 757932348 and (mp.readu_u32)(footerpage, mp.FOOTERPAGE_SZ - 3) == 1043148042 then
  return mp.INFECTED
end
return mp.CLEAN


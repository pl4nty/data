-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7758_267.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0:len() >= 28 and (l_0_0:sub(-28)):lower() == "word/_rels/settings.xml.rels" then
  return mp.INFECTED
end
return mp.CLEAN


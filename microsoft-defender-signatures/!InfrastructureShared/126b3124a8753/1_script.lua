-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\126b3124a8753\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 and isTainted(l_0_0, "obfuscated_golang") then
  (bm.add_related_file)(l_0_0)
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN


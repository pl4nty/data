-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b33e5a9543\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_0, 300) then
  if (mp.IsTrustedFile)(false) == true then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN


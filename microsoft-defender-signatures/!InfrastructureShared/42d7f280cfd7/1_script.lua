-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\42d7f280cfd7\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 then
    local l_0_1 = l_0_0.image_path
    if l_0_1 == nil then
      return mp.CLEAN
    end
    l_0_1 = (string.lower)(l_0_1)
    if checkFileLastWriteTime(l_0_1, 120) ~= false then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end


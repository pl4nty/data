-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10fd70d006d29\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if not isnull(l_0_0) and not isnull(l_0_0.image_path) then
    local l_0_1 = (string.lower)(l_0_0.image_path)
    if (string.find)(l_0_1, "\\webhelpdesk\\bin\\", 1, true) and (string.find)(l_0_1, "java.exe", -8, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


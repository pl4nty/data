-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ccd75e7cc5a7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil and l_0_0.image_path ~= nil then
    local l_0_1 = (string.lower)(l_0_0.image_path)
    if l_0_1:match("([^\\]+)$") == "node.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


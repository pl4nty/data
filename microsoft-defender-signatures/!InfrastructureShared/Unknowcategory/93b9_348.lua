-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93b9_348.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil then
    local l_0_1 = (string.lower)(l_0_0.image_path)
    if l_0_1:match("([^\\]+)$") == "svchost.exe" then
      if (versioning.IsSeville)() then
        return mp.INFECTED
      end
      return mp.LOWFI
    end
  end
  return mp.CLEAN
end


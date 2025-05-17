-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\85d7712eb61a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if not isnull(l_0_0) and not isnull(l_0_0.image_path) then
    local l_0_1 = (string.lower)((string.sub)(l_0_0.image_path, -11))
    if l_0_1 == "svchost.exe" or l_0_1 == "dllhost.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


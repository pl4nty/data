-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13fd7eb008418\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) and (string.find)(l_0_0.image_path, "bun.exe", -7, true) then
    local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
    if isnull(l_0_1) then
      return mp.CLEAN
    end
    if (string.find)((string.lower)(l_0_1), "js", -2, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


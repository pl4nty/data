-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2a7d7c76f3eb8\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) then
  local l_0_1 = l_0_0.image_path
  local l_0_2 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if not isnull(l_0_1) and not isnull(l_0_2) then
    l_0_1 = (string.lower)(l_0_1)
    l_0_2 = (string.lower)(l_0_2)
    if (string.find)(l_0_1, "\\system32\\dllhost.exe", 1, true) and (string.find)(l_0_2, "{3e5fc7f9-9a51-4367-9063-a120244fbec7}", 1, true) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end


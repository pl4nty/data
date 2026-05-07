-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\dad7f4e5a851\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) and ((string.find)(l_0_0.image_path, "/node", -5, true) or (string.find)(l_0_0.image_path, "/bun", -4, true)) then
  local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if isnull(l_0_1) then
    return mp.CLEAN
  end
  if (string.find)((string.lower)(l_0_1), "js", -2, true) then
    local l_0_2 = (mp.GetParentProcInfo)(l_0_0.ppid)
    if not isnull(l_0_2) and not isnull(l_0_2.image_path) and not isnull(l_0_2.ppid) and ((string.find)(l_0_2.image_path, "/node", -5, true) or (string.find)(l_0_2.image_path, "python", 1, true)) then
      local l_0_3 = (mp.GetProcessCommandLine)(l_0_2.ppid)
      if isnull(l_0_3) then
        return mp.CLEAN
      end
      if (string.find)((string.lower)(l_0_3), "js", -2, true) or (string.find)((string.lower)(l_0_3), ".py", -3, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end


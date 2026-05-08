-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a2d799e9c52b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "explorer.exe" then
    local l_0_2 = (mp.GetScannedPPID)()
    local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = l_0_3:match("\\\\[%w%-%.]+%.([%a]+)\\")
    if not l_0_4 then
      return mp.CLEAN
    end
    if isSuspTLD(l_0_4) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end


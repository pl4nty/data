-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\90fd_338.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
  if l_0_1:find("winsas64.bat", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN


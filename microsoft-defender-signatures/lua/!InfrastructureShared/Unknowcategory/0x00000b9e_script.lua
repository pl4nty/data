-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000b9e_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil then
    local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0.ppid))
    if l_0_1:find("\\program files\\", 1, true) then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b3c355f340\0x0000ab29_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
do
  if l_0_1 ~= nil then
    local l_0_2 = (mp.GetParentProcInfo)(l_0_1.ppid)
    if l_0_2 ~= nil and IsKeyInRollingQueue("iscsicpl_bypass", l_0_2.ppid, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b3f564c249\1_luac 

-- params : ...
-- function num : 0
do
  if IsADConnectRole() then
    local l_0_0 = (bm.get_current_process_startup_info)()
    if l_0_0.ppid ~= nil and ((string.find)(l_0_0.ppid, "pid:4$", 1, false) ~= nil or (string.find)(l_0_0.ppid, "pid:4,", 1, true) ~= nil) then
      if GetRollingQueue("TamperAdSyncSvc") == nil then
        return mp.CLEAN
      end
      AppendToRollingQueue("SuspADSyncAccessByPid4", "true", 1, 1800)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end


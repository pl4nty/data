-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\128b35ee69ba8\0x00001d2f_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid or isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED


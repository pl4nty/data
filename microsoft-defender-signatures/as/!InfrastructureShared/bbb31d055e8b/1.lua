-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bbb31d055e8b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\program files", 1, true) or (string.find)(l_0_0, "\\wermgr.exe", 1, true) or (string.find)(l_0_0, "\\werfault.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil then
  return mp.CLEAN
end
if not IsKeyInRollingQueue("IsProcessChainFromWebClipWrite", l_0_1.ppid, true) then
  AppendToRollingQueue("IsProcessChainFromWebClipWrite", l_0_1.ppid, 1, 30)
end
if (string.find)(l_0_0, "\\windows\\microsoft.net\\framework", 1, true) or (string.find)(l_0_0, "\\users\\public\\", 1, true) or (string.find)(l_0_0, "\\appdata\\roaming\\", 1, true) or (string.find)(l_0_0, "\\appdata\\local\\", 1, true) or (string.find)(l_0_0, "\\windows\\temp\\", 1, true) or (string.find)(l_0_0, "\\windows\\syswow64\\", 1, true) or (string.find)(l_0_0, "\\programdata\\", 1, true) then
  (bm.request_SMS)(l_0_1.ppid, "M")
  ;
  (bm.add_action)("SmsAsyncScanEvent", 2000)
end
return mp.INFECTED


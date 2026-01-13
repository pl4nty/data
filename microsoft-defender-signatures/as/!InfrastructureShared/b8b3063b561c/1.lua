-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b8b3063b561c\1.luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 20000000 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (bm.get_process_relationships)()
for l_0_5,l_0_6 in ipairs(l_0_1) do
  if (mp.bitand)(l_0_6.reason_ex, 1) == 1 and l_0_6.image_path ~= nil and l_0_6.ppid ~= nil and (string.find)((string.lower)(l_0_6.image_path), "\\svchost.exe", -12, true) then
    local l_0_7 = (mp.GetProcessCommandLine)(l_0_6.ppid)
    if (string.find)(l_0_7, "localService -p -s RemoteRegistry", 1, true) then
      AddTacticForPid(l_0_6.ppid, "remoteregistry")
    end
  end
end
return mp.INFECTED


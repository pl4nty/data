-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanScriptSuspDownSB\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0)
if l_0_1 ~= nil and l_0_1.image_path ~= nil then
  local l_0_2 = (string.lower)(l_0_1.image_path)
  local l_0_3 = l_0_2:match("([^\\]+)$")
  local l_0_4 = {}
  l_0_4["explorer.exe"] = true
  l_0_4["powershell.exe"] = true
  if l_0_4[l_0_3] then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end


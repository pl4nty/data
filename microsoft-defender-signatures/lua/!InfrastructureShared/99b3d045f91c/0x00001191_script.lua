-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\99b3d045f91c\0x00001191_luac 

-- params : ...
-- function num : 0
local l_0_0 = ((bm.get_current_process_startup_info)()).ppid
local l_0_1 = nil
if l_0_0 ~= nil then
  l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
end
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
  if l_0_1 == nil and (string.len)(l_0_1) <= 4 then
    return mp.CLEAN
  end
  local l_0_2 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|.xml|dotx|dotm|.odt|xlsb|xltx|xltm|xlam|.xla|"
  bm_AddRelatedFileFromCommandLine(l_0_1, l_0_2)
  return mp.INFECTED
end
do
  return mp.CLEAN
end


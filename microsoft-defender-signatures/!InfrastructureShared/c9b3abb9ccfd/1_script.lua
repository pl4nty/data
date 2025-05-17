-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c9b3abb9ccfd\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = 900000000
if l_0_0 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
local l_0_1 = ((bm.get_current_process_startup_info)()).ppid
local l_0_2 = nil
if l_0_1 ~= nil then
  l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
end
if l_0_2 ~= nil then
  l_0_2 = (string.lower)(l_0_2)
  if l_0_2 == nil and (string.len)(l_0_2) <= 4 then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if (this_sigattrlog[7]).matched then
    l_0_3 = (this_sigattrlog[7]).utf8p1
  end
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = nil
  if (this_sigattrlog[8]).matched then
    l_0_4 = (this_sigattrlog[8]).utf8p2
  end
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5 = (string.lower)((string.match)(l_0_3, "([^\\]-[^\\%.]+)$"))
  if not (string.find)((string.lower)(l_0_4), l_0_5, 1, true) then
    return mp.CLEAN
  end
  local l_0_6 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|.js|.vbs|.wsf|.jse|.vbe|"
  bm_AddRelatedFileFromCommandLine(l_0_2, l_0_6)
  do
    do
      if (this_sigattrlog[6]).matched then
        local l_0_7 = (this_sigattrlog[6]).utf8p2
        bm_AddRelatedFileFromCommandLine(l_0_7, l_0_6)
      end
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end


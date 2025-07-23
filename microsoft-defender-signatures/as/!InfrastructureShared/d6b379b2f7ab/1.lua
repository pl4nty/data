-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b379b2f7ab\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
  local l_0_0 = (this_sigattrlog[5]).utf8p2
  local l_0_1 = (bm.get_imagepath)()
  local l_0_2 = (bm.get_current_process_startup_info)()
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2.command_line
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_1) then
    return mp.CLEAN
  end
  if is_valid_ip(l_0_0) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end


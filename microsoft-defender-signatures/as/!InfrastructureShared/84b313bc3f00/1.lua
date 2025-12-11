-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b313bc3f00\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.CLEAN
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  l_0_0 = reportGenericRansomware((this_sigattrlog[2]).utf8p2, true)
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
    l_0_0 = reportGenericRansomware((this_sigattrlog[3]).utf8p2, true)
  end
end
if l_0_0 == mp.INFECTED then
  local l_0_1 = (bm.get_current_process_startup_info)()
  if l_0_1.command_line then
    bm_AddRelatedFileFromCommandLine(l_0_1.command_line, nil, nil, 4)
  end
  local l_0_2, l_0_3 = pcall(reportBmInfo)
  if not l_0_2 and l_0_3 then
    (bm.add_related_string)("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
  end
  reportTimingData()
  return mp.INFECTED
end
do
  return mp.CLEAN
end


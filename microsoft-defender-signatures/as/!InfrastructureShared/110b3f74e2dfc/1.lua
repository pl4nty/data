-- Threat: !InfrastructureShared
-- Name: 110b3f74e2dfc
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|"
  bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1)
  if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
    mp.ReportLowfi(this_sigattrlog[4].utf8p1, 2288844567)
  end
  if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
    local l_0_2 = this_sigattrlog[5].utf8p2
    local l_0_3 = "|.lnk|"
    bm_AddRelatedFileFromCommandLine(l_0_2, l_0_3)
  end
  bm.trigger_sig_self_propagate("SuspChildProcessLaunch", "Behavior:Win32/StarStickle.A!dha")
  return mp.INFECTED
end
return mp.CLEAN

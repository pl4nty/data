-- Threat: !InfrastructureShared
-- Name: 8bb30855943e
-- Type: 21

function add_related_file_wrapper(l_1_0)
  if l_1_0 ~= nil then
    local l_1_1 = mp.GetExecutablesFromCommandLine(l_1_0)
    
    for l_1_2, l_1_3 in ipairs(l_1_1) do
      l_1_3 = mp.ContextualExpandEnvironmentVariables(l_1_3)
      if sysio.IsFileExists(l_1_3) then
        bm.add_related_file(l_1_3)
      end
    end
  end
end

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  add_related_file_wrapper(this_sigattrlog[3].utf8p1)
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  add_related_file_wrapper(this_sigattrlog[3].utf8p2)
end
local l_0_0 = MpCommon.GetPersistContextNoPath("bm_uacbypass_connmgr")
if l_0_0 then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    local l_0_3, l_0_4 = string.match(l_0_2, "(.+);ImagePath:(.+)")
    if l_0_4 then
      l_0_4 = MpCommon.PathToWin32Path(l_0_4)
      if sysio.IsFileExists(l_0_4) then
        mp.ReportLowfi(l_0_4, 3039453400)
      end
    end
  end
end
return mp.INFECTED

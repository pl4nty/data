-- Threat: !InfrastructureShared
-- Name: 119b333601a74
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2))
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = string.match(l_0_0, "wscript[^%s]+%s+\"(.-%.vbs)")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_1) then
    mp.ReportLowfi(l_0_1, 3439210845)
    bm.add_related_file(l_0_1)
  end
end
if this_sigattrlog[3].matched then
  local l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p2))
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = string.match(l_0_2, "powershell.-%-file%s+(.-%.ps1)")
  if l_0_3 == nil then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_3) then
    mp.ReportLowfi(l_0_3, 1442275559)
    bm.add_related_file(l_0_3)
  end
end
return mp.INFECTED

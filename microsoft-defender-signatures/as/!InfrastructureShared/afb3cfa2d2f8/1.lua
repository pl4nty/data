-- Threat: !InfrastructureShared
-- Name: afb3cfa2d2f8
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
  if sysio.IsFileExists(l_0_0) and string.sub(l_0_0, -3) == ".js" then
    bm.add_threat_file(l_0_0)
  end
end
return mp.INFECTED

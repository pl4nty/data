-- Threat: !InfrastructureShared
-- Name: 2db339ba7f5e
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[1].utf8p2)
  if string.find(l_0_0, "base64 -d", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

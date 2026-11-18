-- Threat: !InfrastructureShared
-- Name: 51b3af66629b
-- Type: 21

if bm.GetSignatureMatchDuration() > 80000000 then
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[3].matched then
  local l_0_0, l_0_1 = string.match(this_sigattrlog[2].utf8p1, ";targetprocessp(pid:%d%d+):(%d%d%d%d+)$")
  local l_0_2, l_0_3 = string.match(this_sigattrlog[3].utf8p1, ";targetprocessp(pid:%d%d+):(%d%d%d%d+)$")
  if l_0_0 == l_0_2 and l_0_1 == l_0_3 then
    local l_0_4 = string.format("%s,ProcessStart:%s", l_0_0, l_0_1)
    bm.trigger_sig("ProcessInjectedBy", "BMGenCodeInjector.C", l_0_4)
  end
end
return mp.CLEAN

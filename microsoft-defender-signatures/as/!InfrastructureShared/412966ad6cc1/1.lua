-- Threat: !InfrastructureShared
-- Name: 412966ad6cc1
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 20000 then
    return mp.CLEAN
  end
  if 50000 < l_0_0 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, l_0_0)
  if l_0_1:match("/URI %(http%://usaa%.com%-sec%-inet%-auth%-logon%-ent%-logon%-logon%-") then
    return mp.INFECTED
  end
end
return mp.CLEAN
